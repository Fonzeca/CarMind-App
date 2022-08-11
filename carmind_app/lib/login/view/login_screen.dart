import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/nueva_contrasena/nueva_contrasena.dart';
import 'package:carmind_app/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../profile/profile.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';
import '../login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    configEasyLoading();
    BlocProvider.of<LoginBloc>(context).add(const ValidateSavedToken());
    FormService formServiceEmail = FormService();
    FormService formServicePass = FormService();
    final emailCon = TextEditingController();
    final passwordCon = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is FirstLogin) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NuevaConstrasena(child: IngresarContrasena(), appBarTitle: 'Restaurar Contraseña')));
        } else if (state is LoginOk) {
          BlocProvider.of<ProfileBloc>(context).add(GetLoggedEvent(context));

          final prefs = await SharedPreferences.getInstance();
          if (prefs.getBool("on_boarding_finish") ?? false) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CarMindNavigationBar()), (obj) => false);
          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnBoardingContent()), (obj) => false);
          }

          BlocProvider.of<LoginBloc>(context).add(ResetScreen());
          emailCon.clear();
          passwordCon.clear();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Material(
            child: _LoginView(emailCon: emailCon, passwordCon: passwordCon, formServiceEmail: formServiceEmail, formServicePass: formServicePass),
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
    required this.formServiceEmail,
    required this.formServicePass,
  }) : super(key: key);

  final TextEditingController emailCon;
  final TextEditingController passwordCon;
  final FormService formServiceEmail;
  final FormService formServicePass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Form(
                  key: formServiceEmail.keyForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: CustomInput(controller: emailCon, label: 'E-mail')),
              const SizedBox(
                height: 16,
              ),
              Form(
                  key: formServicePass.keyForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: CustomInput(controller: passwordCon, label: 'Contraseña', isPassword: true)),
              const SizedBox(height: 52 - 18),
              CustomElevatedButton(
                  text: 'Iniciar sesión',
                  shapeColor: carMindTopBar,
                  textColor: Colors.white,
                  onPressed: () => (formServiceEmail.isValidForm() && formServicePass.isValidForm())
                      ? BlocProvider.of<LoginBloc>(context).add(AttemptToLogin(emailCon.text, passwordCon.text))
                      : null),
              const SizedBox(height: 27 - 8),
              TextButton(
                  onPressed: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NuevaConstrasena(appBarTitle: 'Restaurar Contraseña', child: IngresarEmail())))),
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
