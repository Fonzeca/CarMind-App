import 'dart:async';
import 'dart:io';

import 'package:carmind_app/constants.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/nueva_contrasena/nueva_contrasena.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'services/services.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    initializeDateFormatting('es_AR');
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    var sh = await SharedPreferences.getInstance();
    sh.setBool("offline", false);

    final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    HydratedBlocOverrides.runZoned(
      () => runApp(MyApp()),
      storage: storage,
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

Dio? staticDio;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey _materialAppKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MaterialApp(
        key: _materialAppKey,
        title: 'CarMind',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
        home: Scaffold(body: Builder(builder: (_) {
          configDio(_materialAppKey.currentContext!);
          return LoginScreen();
        })),
        builder: EasyLoading.init(),
      ),
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => NuevaConstrasenaBloc()),
        BlocProvider(create: (context) => FormularioBloc()),
        BlocProvider(create: (context) => RealizarEvaluacionBloc()),
        BlocProvider(create: (context) => QrScannerBloc()),
        BlocProvider(create: (context) => VehiculoBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => OfflineBloc())
      ],
    );
  }

  configDio(BuildContext context) {
    staticDio = Dio();
    staticDio?.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.uri.path.contains("login") && !options.uri.path.contains("public")) {
        var prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString("token");
        options.headers.addAll({'Authorization': "Bearer $token"});
      }
      handler.next(options);
    }, onResponse: (r, handler) {
      if (r.statusCode != 200) {
        String message = r.data.toString();
        if (r.data.message != null) {
          message = r.data.message;
        }
        EasyLoading.showError(message);
      }
      handler.next(r);
    }, onError: (e, handler) async {
      if (e.response != null && e.response!.statusCode == 403) {
        EasyLoading.showError(expiredSessionError, duration: const Duration(seconds: 3));
        await Future.delayed(const Duration(seconds: 3));
        BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
      } else if (e.error is SocketException) {
        if (OfflineModeService.isLogged) {
          EasyLoading.dismiss();
          OfflineModeService.setOffline();
          EasyLoading.showInfo(changeMode, duration: const Duration(seconds: 3));
          Future.delayed(const Duration(seconds: 3), () {
            //OfflineModeService.lastFunctionCalled();
            handler.next(e);
          });
          return;
        }
        if (OfflineModeService.isChangingPass) {
          EasyLoading.showInfo(noInternet, duration: const Duration(seconds: 3));
          return;
        }
        if (!OfflineModeService.isOffline(context: context)) {
          EasyLoading.dismiss();
          OfflineModeService.setOffline();
          EasyLoading.showInfo(changeMode, duration: const Duration(seconds: 3));
          Future.delayed(const Duration(seconds: 3), () {
            BlocProvider.of<LoginBloc>(context).add(const ValidateSavedToken());
          });
        }
      } else {
        Response r = e.response!;
        if (r.statusCode != 200) {
          String message = r.data.toString();
          if (r.data is Map<String, dynamic> && r.data["message"] != null) {
            message = r.data["message"].toString();
          }
          EasyLoading.showError(message);
        }
        handler.next(e);
      }
    }));

    //TODO: Agujero en la seguridad.
    (staticDio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }
}
