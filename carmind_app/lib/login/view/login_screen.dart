import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';
import '../../nueva_contrasena/view/nueva_contrasena.dart';
import '../../nueva_contrasena/view/ingresar_email.dart';
import 'package:carmind_app/home/view/navigation_bar.dart';
import 'package:carmind_app/login/bloc/login_bloc.dart';
import 'package:carmind_app/nueva_contrasena/view/ingresar_contrasena.dart';
import 'package:carmind_app/on_boarding/view/on_boarding_content.dart';
import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:carmind_app/profile/bloc/profile_bloc.dart';



class LoginScreen extends StatelessWidget {
  bool? offline = false;
  LoginScreen({Key? key, this.offline}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    configEasyLoading();
    BlocProvider.of<LoginBloc>(context).add(ValidateSavedToken(offline ?? false));

    final emailCon = TextEditingController();
    final passwordCon = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is FirstLogin) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NuevaConstrasena(child: IngresarContrasena(), appBarTitle: 'Restaurar Contraseña')), (obj) => false);
        } else if (state is LoginOk) {
          //Si esta ok, hacemos get del loggeduser
          BlocProvider.of<ProfileBloc>(context).add(GetLoggedEvent());

          //Si se uso para actualizar el token o para iniciar sesion
          if (offline != null && offline!) {
            //Seteamos online en true, sincronizando los datos
            BlocProvider.of<OfflineBloc>(context).add(SetOnline());
            Navigator.pop(context);
          } else {
            //Le damos para adelante a la app
            final prefs = await SharedPreferences.getInstance();
            if (prefs.getBool("on_boarding_finish") ?? false) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CarMindNavigationBar()), (obj) => false);
            } else {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnBoardingContent()), (obj) => false);
            }
          }
          BlocProvider.of<LoginBloc>(context).add(ResetScreen());
          emailCon.clear();
          passwordCon.clear();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Material(
            child: _LoginView(emailCon: emailCon, passwordCon: passwordCon),
          );
        },
      ),
    );
  }



  void configEasyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorType = EasyLoadingIndicatorType.fadingFour;
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    Key? key,
    required this.emailCon,
    required this.passwordCon,
  }) : super(key: key);

  final TextEditingController emailCon;
  final TextEditingController passwordCon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 24, left: 34, right: 34, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                child: Image.asset("assets/logo.png", width: 87, height: 87),
              ),
              const SizedBox(height: 11),
              const Text(
                "CarMind",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 32),
              const Text(
                "Ingresá a tu cuenta",
                style: subtitleStyle,
              ),
              const SizedBox(height: 20),
              CustomInput(controller: emailCon, label: 'E-mail'),
              const SizedBox(
                height: 16,
              ),
              CustomInput(controller: passwordCon, label: 'Contraseña', isPassword: true),
              const SizedBox(height: 52 - 18),
              CustomElevatedButton(text: 'Iniciar sesión',shapeColor: carMindTopBar, textColor: Colors.white
              , onPressed:  () => BlocProvider.of<LoginBloc>(context).add(AttemptToLogin(emailCon.text, passwordCon.text))),
              const SizedBox(height: 27 - 8),
              TextButton(
                  onPressed: (() => Navigator.push(context, MaterialPageRoute(builder: (context) => const NuevaConstrasena(appBarTitle: 'Restaurar Contraseña', child: IngresarEmail())))),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(carMindAccentColor.withOpacity(0.2)), 
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    "Olvidé mi contraseña",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                  ))
              ],
            ),
        ),
      ),
    );
  }
}
