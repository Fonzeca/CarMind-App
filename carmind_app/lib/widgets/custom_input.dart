import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

import '../constants.dart';
import '../nueva_contrasena/nueva_contrasena.dart';

class CustomInput extends StatelessWidget {
  final Key? textFormFieldKey;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final ValueNotifier<bool> _passwordVisible = ValueNotifier(false);

  CustomInput({Key? key, required this.controller, required this.label, this.isPassword = false, this.validator, this.textFormFieldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder(
              valueListenable: isPassword ? _passwordVisible : ValueNotifier(true),
              builder: (context, value, child) {
                return TextFormField(
                  key: textFormFieldKey,
                  validator: validator ??
                      (text) {
                        BlocProvider.of<NuevaConstrasenaBloc>(context).add(InputValueChangedEvent());
                        return _checkErrors(text);
                      },
                  keyboardType: isPassword ? null : TextInputType.emailAddress,
                  controller: controller,
                  obscureText: isPassword ? !_passwordVisible.value : false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: carMindPrimaryButton, width: 3)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                    suffixIcon: isPassword
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
        ],
      ),
    );
  }

  String? _checkErrors(String? text) {
    if (isPassword) {
      if (text!.length >= 6) {
        return null;
      }
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (EmailValidator.validate(text ?? '')) {
      return null;
    }
    return 'Ingrese un correo válido';
  }
}
