import 'dart:async';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/firebase_options.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/nueva_contrasena/nueva_contrasena.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/rutas/bloc/routes_bloc.dart';
import 'package:carmind_app/services/push_notifications_service.dart';
import 'package:carmind_app/util/custom_interceptor.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:carmind_app/util/offline_managers/offline_module.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await PushNotificationsService.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    final dir = await getApplicationSupportDirectory();

    // Open Isar in the UI isolate
    final isar = await Isar.open(
      name: 'isar-carmind',
      schemas: [
        LogUsoSchema,
        LoggedUserSchema,
        OpcionPojoSchema,
        VehiculoDbSchema,
        EvaluacionDbSchema,
        LogEvaluacionSchema,
        PreguntaPojoDbSchema,
        RespuestaPojoDbSchema,
        RespuestaOpcionPojoSchema,
        EvaluacionesPendientesSchema,
        EvaluacionTerminadaPojoDbSchema,
        LogEvaluacionTerminadaPojoDbSchema
      ],
      directory: dir.path,
    );

    //Setear el comportamineto a oofline off hasta que se implemente la función
    //Sacar en la version 1.0.9
    var sh = await SharedPreferences.getInstance();
    if (sh.getBool("offline") != null && sh.getBool("offline")!) {
      sh.setBool("offline", false);
    }

    final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    var backgroundService = FlutterBackgroundService();
    GetIt.I.registerSingleton<FlutterBackgroundService>(backgroundService);
    GetIt.I.registerSingleton<OfflineManager>(OfflineManager(sh, backgroundService));

    HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(sh)),
      storage: storage,
    );
  }, (error, stack) => {if (!kDebugMode) FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)});
}

Dio? staticDio;

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  final SharedPreferences sharedPreferences;
  MyApp(this.sharedPreferences, {Key? key}) : super(key: key);

  final GlobalKey _materialAppKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetIt.I.registerSingleton<HomeBloc>(HomeBloc());
    configDio(sharedPreferences);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I.get<HomeBloc>()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => NuevaConstrasenaBloc()),
        BlocProvider(create: (context) => FormularioBloc()),
        BlocProvider(create: (context) => RealizarEvaluacionBloc()),
        BlocProvider(create: (context) => QrScannerBloc()),
        BlocProvider(create: (context) => VehiculoBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => RoutesBloc())
      ],
      child: MaterialApp(
        key: _materialAppKey,
        title: 'CarMind',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
        home: Scaffold(body: Builder(builder: (_) {
          return const LoginScreen();
        })),
        builder: EasyLoading.init(),
      ),
    );
  }

  configDio(SharedPreferences sharedPreferences) async {
    staticDio = Dio();

    var offlineModule = OfflineModule(sharedPreferences: sharedPreferences, dio: staticDio!);
    staticDio?.httpClientAdapter = offlineModule.httpClientAdapter;
    staticDio?.interceptors.add(offlineModule.offlineInterceptor);
    staticDio?.interceptors.add(CustomInterceptor());
  }
}
