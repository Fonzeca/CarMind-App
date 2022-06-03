import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/profile/logged_user.dart';
import 'package:carmind_app/api/pojo/vehiculo/log_uso.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/formularios/bloc/formulario_bloc.dart';
import 'package:carmind_app/formularios/bloc/realizar_evaluacion_bloc.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/login/bloc/login_bloc_bloc.dart';
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:carmind_app/profile/bloc/profile_bloc.dart';
import 'package:carmind_app/vehiculo/bloc/qr_scanner_bloc.dart';
import 'package:carmind_app/vehiculo/bloc/vehiculo_bloc.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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

  runApp(MyApp());
}

const carMindAccentColor = Color(0xff8ed8f8);
const carMindAccent2Color = Color(0xff0078FF);
const carMindPrimaryButton = Color(0xffB6E802);
const carMindTopBar = Color(0xff000853);
const carMindGrey = Color(0xff212121);
Dio? staticDio;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey _scaffoldKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    configDio(context);
    return MultiBlocProvider(
      child: MaterialApp(
        key: _scaffoldKey,
        title: 'CarMind',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
        home: Scaffold(
          body: LoginScreen(),
        ),
        builder: EasyLoading.init(),
      ),
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => LoginBlocBloc()),
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
    }, onError: (e, handler) {
      Response r = e.response!;
      if (r.statusCode != 200) {
        String message = r.data.toString();
        if (r.data["message"] != null) {
          message = r.data["message"].toString();
        }
        EasyLoading.showError(message);
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
