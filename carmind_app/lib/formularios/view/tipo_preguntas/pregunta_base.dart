import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreguntaBase extends StatelessWidget {
  final Widget child;
  final bool preguntaEnabled;

  const PreguntaBase({Key? key, required this.child, required this.preguntaEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: preguntaEnabled ? 2 : 0,
      shadowColor: preguntaEnabled ? Colors.black : null,
      color: preguntaEnabled ? null : Colors.black.withOpacity(0.2),
      child: child,
    );
  }
}
