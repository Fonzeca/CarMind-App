import 'package:carmind_app/nueva_contrasena/view/ingresar_contrasena.dart';
import 'package:carmind_app/widgets/custom_short_input.dart';
import 'package:flutter/material.dart';

import 'package:carmind_app/nueva_contrasena/bloc/nueva_contrasena_bloc.dart';
import 'package:carmind_app/widgets/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart' as constants;
import '../../main.dart';
import 'nueva_contrasena.dart';

class IngresarCodigo extends StatelessWidget {

  final String email;

  const IngresarCodigo({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstCon = TextEditingController();
    final secondCon = TextEditingController();
    final thirdCon = TextEditingController();
    final fourthCon = TextEditingController();
    final firstFocusNode = FocusNode();
    final secondFocusNode = FocusNode();
    final thirdFocusNode = FocusNode();
    final fourthFocusNode = FocusNode();
    return BlocListener<NuevaConstrasenaBloc, NuevaContrasenaState>(
    listener: (context, state) async {
        if (!state.inputChangedValue && state.codigo.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NuevaConstrasena(child: IngresarContrasena(email: state.email), appBarTitle: 'Restaurar Contraseña')));
        }
    },
    child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Codigo enviado a $email', style: constants.titleStyle),
              const SizedBox(height: 20),
              const Align(alignment: Alignment.centerLeft,child: Text('Ingresa el codigo de 4 digitos', style: constants.subtitleStyle)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomShortInput(controller: firstCon, focusNode: firstFocusNode, nextFocus: secondFocusNode),
                CustomShortInput(controller: secondCon, focusNode: secondFocusNode, nextFocus: thirdFocusNode),
                CustomShortInput(controller: thirdCon, focusNode: thirdFocusNode, nextFocus: fourthFocusNode,),
                CustomShortInput(controller: fourthCon, focusNode: fourthFocusNode)
              ]),
              const SizedBox(height: 20),
              CustomElevatedButton(text: 'Verificar código',shapeColor: carMindPrimaryButton, textColor: Colors.black, onPressed: () =>  BlocProvider.of<NuevaConstrasenaBloc>(context).add(VerificarCodigoEvent(email, '${firstCon.text}${secondCon.text}${thirdCon.text}${fourthCon.text}')))
            ],
          )
    );
  }
}