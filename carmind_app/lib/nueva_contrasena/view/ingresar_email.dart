import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';
import 'package:carmind_app/nueva_contrasena/view/ingresar_codigo.dart';
import 'package:carmind_app/nueva_contrasena/view/nueva_contrasena.dart';
import 'package:carmind_app/services/form_service.dart';
import 'package:carmind_app/nueva_contrasena/bloc/nueva_contrasena_bloc.dart';


class IngresarEmail extends StatelessWidget {

  const IngresarEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailCon = TextEditingController();
    FormService formService = FormService();
    return BlocListener<NuevaConstrasenaBloc, NuevaContrasenaState>(
    listener: (context, state) async {
        if (state.email.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NuevaConstrasena(child: IngresarCodigo(email: state.email), appBarTitle: 'Restaurar Contraseña',)));
        }
    },
    child: BlocBuilder<NuevaConstrasenaBloc, NuevaContrasenaState>(
      builder: (context, state) {
      if(state.timeLeft == -1 && state.email.isEmpty){
        BlocProvider.of<NuevaConstrasenaBloc>(context).add(StartCountEvent());
      }
      return Form(
      key: formService.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('¿Olvidaste tu contraseña?', style: titleStyle),
                const SizedBox(height: 20),
                const Text('No hay problema. Te enviaremos un código para restaurar tu contraseña.', style: subtitleStyle),
                const SizedBox(height: 20),
                CustomInput(controller: emailCon, label: 'E-mail'),
                const SizedBox(height: 52 - 18),
                CustomElevatedButton(
                  text: 'Restaurar contraseña',
                  shapeColor: carMindPrimaryButton, 
                  textColor: Colors.black, 
                  onPressed: (state.timeLeft > -1) ? null : (){
                    if ( formService.isValidForm() ){
                      BlocProvider.of<NuevaConstrasenaBloc>(context).add(RestaurarContrasenaEvent(emailCon.text));
                    }
                  }
                ),
                if(state.timeLeft >= 0 && state.timeLeft < 60)...[
                  const SizedBox(height:30),
                  const Text('Espera antes de volver a intentarlo'),
                  const SizedBox(height:8),
                  LinearProgressIndicator(
                    value: state.timeLeft/60,
                    backgroundColor: carMindTopBar,
                    color: carMindPrimaryButton,
                ),
                ]
              ],
            ),
      );
        },
      ),
     );
  }
}