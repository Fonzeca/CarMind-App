import 'package:carmind_app/formularios/bloc/formulario_bloc.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/login/bloc/login_bloc_bloc.dart';
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

const carMindAccentColor = Color(0xff8ed8f8);
const carMindAccent2Color = Color(0xff0078FF);
const carMindPrimaryButton = Color(0xffB6E802);
const carMindTopBar = Color(0xff000853);
const carMindGrey = Color(0xff212121);
Dio? staticDio;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    configDio();
    return MultiBlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Roboto"
        ),
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => LoginBlocBloc()),
        BlocProvider(create: (context) => FormularioBloc()),
        BlocProvider(create: (context) => RealiazarEvaluacionBloc()),
      ],
    );
  }

  configDio(){
    staticDio = Dio();
    staticDio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if(!options.uri.path.contains("login") && !options.uri.path.contains("public")){
          var prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString("token");
          options.headers.addAll({'Authorization' : "Bearer $token"});
        }
        handler.next(options);
      },
    ));
  }
}
