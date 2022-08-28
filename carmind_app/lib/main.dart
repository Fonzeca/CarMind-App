import 'dart:async';
import 'dart:io';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/lifecycle_manager.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/map/map.dart';
import 'package:carmind_app/nueva_contrasena/nueva_contrasena.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/services/services.dart';
import 'package:carmind_app/util/background_service.dart';
import 'package:carmind_app/util/custom_dio/client_adapter.dart';
import 'package:carmind_app/util/custom_dio/mock_db.dart';
import 'package:carmind_app/util/custom_dio/offline_interceptor.dart';
import 'package:carmind_app/util/custom_dio/offline_manager.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await PushNotificationsService.initializeApp();
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    final dir = await getApplicationSupportDirectory();

    // Open Isar in the UI isolate
    final isar = await Isar.open(
      name: 'isar-carmind',
      schemas: [VehiculoSchema],
      directory: dir.path,
    );

    await Hive.initFlutter();
    Hive.registerAdapter(VehiculoAdapter());
    Hive.registerAdapter(EvaluacionesPendientesAdapter());
    Hive.registerAdapter(EvaluacionAdapter());
    Hive.registerAdapter(PreguntaPojoAdapter());
    Hive.registerAdapter(OpcionPojoAdapter());
    Hive.registerAdapter(LogEvaluacionAdapter());
    Hive.registerAdapter(LoggedUserAdapter());
    Hive.registerAdapter(LogUsoAdapter());
    Hive.registerAdapter(LogEvaluacionTerminadaPojoAdapter());
    Hive.registerAdapter(EvaluacionTerminadaPojoAdapter());
    Hive.registerAdapter(RespuestaPojoAdapter());
    Hive.registerAdapter(RespuestaOpcionPojoAdapter());

    await Hive.openBox<Vehiculo>('vehiculos');
    await Hive.openBox<LogEvaluacion>('logs');
    await Hive.openBox<LoggedUser>('loggedUser');
    await Hive.openBox<Evaluacion>('evaluaciones');
    await Hive.openBox<LogUso>('logUso');
    await Hive.openBox<LogEvaluacionTerminadaPojo>('evaluacionesTerminadas');

    //Setear el comportamineto a oofline off hasta que se implemente la función
    var sh = await SharedPreferences.getInstance();
    if (sh.getBool("offline") != null && sh.getBool("offline")!) {
      sh.setBool("offline", false);
    }

    final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    var service = FlutterBackgroundService();

    HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(sh, service)),
      storage: storage,
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

Dio? staticDio;

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  final SharedPreferences sharedPreferences;
  final FlutterBackgroundService service;
  MyApp(this.sharedPreferences, this.service, {Key? key}) : super(key: key);

  final GlobalKey _materialAppKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MultiBlocProvider(
        child: MaterialApp(
          key: _materialAppKey,
          title: 'CarMind',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
          home: Scaffold(body: Builder(builder: (_) {
            configDio(_materialAppKey.currentContext!, sharedPreferences, service);
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
          BlocProvider(create: (context) => OfflineBloc()),
          BlocProvider(create: (context) => MapBloc()),
        ],
      ),
      service: service,
    );
  }

  configDio(BuildContext context, SharedPreferences sharedPreferences, FlutterBackgroundService service) async {
    staticDio = Dio();

    var offlineManager = OfflineManager(sharedPreferences);
    var mockDb = MockDb(sharedPreferences);
    var offlineHttpClientAdapter = OfflineHttpClientAdapter(getter: offlineManager, mock: mockDb);
    var httpInterceptor = OfflineInterceptor(dio: staticDio!, offlineManager: offlineManager);
    staticDio?.httpClientAdapter = offlineHttpClientAdapter;
    staticDio?.interceptors.add(httpInterceptor);

    var offlineBackgroundService = OfflineBackgroundService(mock: mockDb, service: service);
    await offlineBackgroundService.initializeService();

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
        EasyLoading.showError(noInternet);
        FirebaseCrashlytics.instance
            .recordError('Ruta: ${e.requestOptions.path} Mensaje: ${e.error.toString()}', StackTrace.current, reason: noInternet);
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
  }
}
