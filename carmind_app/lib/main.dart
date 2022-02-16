import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

const carMindAccentColor = Color(0xff8ed8f8);
const carMindPrimaryButton = Color(0xffB6E802);
const carMindTopBar = Color(0xff000853);
const carMindGrey = Color(0xff212121);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: LoginScreen(),
        ),
      ),
      providers: [
        BlocProvider(create: (context) => HomeBloc(),)
      ],
    );
  }
}
