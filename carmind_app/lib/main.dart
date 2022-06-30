import 'dart:async';
import 'dart:io';

import 'package:carmind_app/constants.dart';
import 'package:carmind_app/formularios/bloc/pregunta_KM_bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/nueva_contrasena/nueva_contrasena.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';

void main() async {

  runZonedGuarded<Future<void>>(() async {

    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

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
    HydratedBlocOverrides.runZoned(
      () => runApp(MyApp()),
      storage: storage,
  );
  }, (error, stack) =>
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
Dio? staticDio;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MaterialApp(
        title: 'CarMind',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
        home: Scaffold(
          body: Builder(builder:(currentContext) {
            configDio(currentContext);
            return LoginScreen();
          })
        ),
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
      if(e.response != null && e.response!.statusCode == 403){
        EasyLoading.showError(expiredSessionError);
        //TODO hacer posible esto
        //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        //BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
      }else if(e.error is SocketException){
        EasyLoading.showError(noInternet);
        FirebaseCrashlytics.instance.recordError(
          'Ruta: ${e.requestOptions.path} Mensaje: ${e.error.toString()}',
          StackTrace.current,
          reason: noInternet
        );
      }else{
        Response r = e.response!;
        if (r.statusCode != 200) {
          String message = r.data.toString();
          if (r.data["message"] != null) {
            message = r.data["message"].toString();
          }
          EasyLoading.showError(message);
        }
      }
      handler.next(e);
    }));

    //TODO: Agujero en la seguridad.
    (staticDio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }
}
