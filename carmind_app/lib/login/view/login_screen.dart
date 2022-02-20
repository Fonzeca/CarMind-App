import 'package:carmind_app/home/view/navigation_bar.dart';
import 'package:carmind_app/login/bloc/login_bloc_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> _passwordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _checkBoxChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final emailCon = TextEditingController();
    final passwordCon = TextEditingController();

    return BlocListener<LoginBlocBloc, LoginBlocState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is LoginOk) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CarMindNavigationBar()));
          emailCon.clear();
          passwordCon.clear();
        }
      },
      child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
        builder: (context, state) {
          return Stack(
            children: [
              _buildContent(emailCon, passwordCon, context),
              () {
                if (state is LoginLoading) {
                  return Center(
                    child: LoadingAnimationWidget.hexagonDots(
                      color: Colors.blue,
                      size: 50,
                    ),
                  );
                }
                return const SizedBox();
              }(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(TextEditingController emailCon, TextEditingController passwordCon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 34, right: 34),
      child: SingleChildScrollView(
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            _fieldLogin(emailCon, "E-mail"),
            const SizedBox(
              height: 16,
            ),
            _fieldLogin(passwordCon, "Contraseña", true),
            SizedBox(
              height: 18 + 15 + 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _checkBoxChecked,
                    builder: (context, value, child) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        width: 18,
                        child: Checkbox(
                          value: _checkBoxChecked.value,
                          onChanged: _onClickCheckBox,
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () => _onClickCheckBox(null),
                    child: Row(
                      children: [
                        Container(width: 15, height: double.infinity, color: Colors.transparent),
                        const Text(
                          "Recordarme",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 52 - 18),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(carMindTopBar),
                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                onPressed: () => BlocProvider.of<LoginBlocBloc>(context).add(AttemptToLogin("alexisfonzos@gmail.com", "123", _checkBoxChecked.value)),
                child: const Text("Iniciar sesión"),
              ),
            ),
            const SizedBox(height: 27-8),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Olvidé mi contraseña",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }

  Widget _fieldLogin(TextEditingController controller, String label, [bool password = false]) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: ValueListenableBuilder(
                valueListenable: password ? _passwordVisible : ValueNotifier(true),
                builder: (context, value, child) {
                  return TextField(
                    controller: controller,
                    obscureText: password ? !_passwordVisible.value : false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: carMindPrimaryButton, width: 3)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                      suffixIcon: password
                          ? IconButton(
                              icon: Icon(!_passwordVisible.value ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                _passwordVisible.value = !_passwordVisible.value;
                              },
                            )
                          : null,
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  _onClickCheckBox(bool? value) {
    _checkBoxChecked.value = !_checkBoxChecked.value;
  }
}
