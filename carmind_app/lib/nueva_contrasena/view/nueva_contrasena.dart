
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:carmind_app/nueva_contrasena/bloc/nueva_contrasena_bloc.dart';
import 'package:carmind_app/nueva_contrasena/view/ingresar_codigo.dart';
import 'package:carmind_app/nueva_contrasena/view/ingresar_contrasena.dart';
import 'package:carmind_app/nueva_contrasena/view/ingresar_email.dart';
import 'package:flutter/material.dart';
import 'package:carmind_app/widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevaConstrasena extends StatelessWidget {
  final String appBarTitle;
  final Widget child;
  
  const NuevaConstrasena({Key? key, required this.appBarTitle, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     return BlocBuilder<NuevaConstrasenaBloc, NuevaContrasenaState>(
        builder: (context, state) {
          return Material(
            child: Scaffold(
                appBar: CustomAppBar(
                onPressed: (){
                  BlocProvider.of<NuevaConstrasenaBloc>(context).add(PopEvent());
                  Navigator.pop(context);
                  },
                  title: appBarTitle,
                  ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 34, right: 34),
                  child: SingleChildScrollView(
                    child: child
                  ),
                ),
              ),
          );
        },
      );
  }
}