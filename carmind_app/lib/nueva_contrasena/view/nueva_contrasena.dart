import 'package:carmind_app/nueva_contrasena/bloc/nueva_contrasena_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/services.dart';
import '../../widgets/widgets.dart';

class NuevaConstrasena extends StatelessWidget {
  final String appBarTitle;
  final Widget child;

  const NuevaConstrasena({Key? key, required this.appBarTitle, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OfflineModeService.isChangingPass = true;
    return BlocBuilder<NuevaConstrasenaBloc, NuevaContrasenaState>(
      builder: (context, state) {
        return Material(
          child: Scaffold(
            appBar: CustomAppBar(
              onPressed: () {
                BlocProvider.of<NuevaConstrasenaBloc>(context).add(PopEvent());
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
              title: appBarTitle,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 24, left: 34, right: 34),
              child: SingleChildScrollView(reverse: true, child: child),
            ),
          ),
        );
      },
    );
  }
}
