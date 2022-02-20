import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/util/CustomRadio.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreguntaS2 extends StatelessWidget {
  final PreguntaPojo pregunta;

  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaS2({Key? key, required this.pregunta}) : super(key: key);

  bool? preguntaEnabled;

  bool buttonEnabled = true;

  bool preguntaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
      builder: (context, state) {
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);
        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  pregunta.descripcion!,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 13),
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildOptions(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20 - 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                      color: preguntaEnabled! ? null : const Color(0xFF6F6F6F),
                    ),
                    padding: EdgeInsets.zero,
                    iconSize: 23,
                    onPressed: () {
                      BlocProvider.of<RealiazarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!));
                      preguntaFinalizada = true;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 17 - 12),
            ],
          ),
        );
      },
    );
  }

  List<int> listIds = [];

  List<Widget> _buildOptions() {
    List<Widget> list = [];
    pregunta.opciones!.asMap().forEach((index, value) {
      list.add(const SizedBox(height: 6));
      var widget = Row(
        children: [
          CustomRadio(
            id: value.id!,
            listIds: List.from(listIds),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.isNotEmpty && states.first == MaterialState.disabled) {
                return const Color(0xFF6F6F6F);
              }
              return carMindAccent2Color;
            }),
            enabled: preguntaEnabled!,
            onChanged: preguntaEnabled!
                ? (valueInt) {
                    if (valueInt != -1) {
                      listIds.add(valueInt!);
                    } else {
                      listIds.remove(value.id);
                    }
                    reconstruye.value = !reconstruye.value;
                  }
                : null,
          ),
          Text(
            value.texto!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      );
      list.add(widget);
    });
    list.removeAt(0);
    return list;
  }
}
