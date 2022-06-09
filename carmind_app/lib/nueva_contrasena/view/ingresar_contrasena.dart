import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';
import '../../services/form_service.dart';
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:carmind_app/nueva_contrasena/bloc/nueva_contrasena_bloc.dart';


class IngresarContrasena extends StatelessWidget {

  final String? codigo;
  final String? email;

  const IngresarContrasena({Key? key, this.codigo, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newPassCon = TextEditingController();
    final oldPassCon = TextEditingController();
    FormService formService = FormService();
    return BlocListener<NuevaConstrasenaBloc, NuevaContrasenaState>(
    listener: (context, state) async {
        if (!state.inputChangedValue){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
    },
    child: BlocBuilder<NuevaConstrasenaBloc, NuevaContrasenaState>(
      builder: (context, state) {
      return Form(
      key: formService.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('Crea tu nueva contraseña', style: titleStyle),
              const SizedBox(height: 20),
              const Align(alignment: Alignment.centerLeft,child: Text('Ingresa tu nueva contraseña', style: subtitleStyle)),
              const SizedBox(height: 20),
              CustomInput(controller: newPassCon, label: 'Nueva contraseña', isPassword: true, validator: state.arePassEquals ? null : (_) => 'Las contraseñas no coinciden'),
              const SizedBox(height: 20),
              CustomInput(controller: oldPassCon, label: 'Verificar contraseña', isPassword: true, validator: state.arePassEquals ? null : (_) => 'Las contraseñas no coinciden'),
              const SizedBox(height: 52 - 18),
              CustomElevatedButton(
                text: 'Cambiar contraseña',
                shapeColor: carMindPrimaryButton, 
                textColor: Colors.black, 
                onPressed: (){
                  if(oldPassCon.text.compareTo(newPassCon.text) == 0){
                      if(codigo != null){
                        BlocProvider.of<NuevaConstrasenaBloc>(context).add(CambiarContrasenaEvent(email!, codigo!, newPassCon.text));
                      }else{
                         BlocProvider.of<NuevaConstrasenaBloc>(context).add(NuevaContrasenaEnPrimerLoginEvent(newPassCon.text));
                      }
                  }else{
                    BlocProvider.of<NuevaConstrasenaBloc>(context).add(ArePassNotEqualsEvent());
                  }
                }
              )
            ],
          )
      );
      }
    )
    );
  }
}