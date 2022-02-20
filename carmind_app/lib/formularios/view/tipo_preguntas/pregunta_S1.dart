
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/util/CustomCheckBox.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PreguntaS1 extends StatelessWidget {
  final PreguntaPojo pregunta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaS1({Key? key, required this.pregunta}) : super(key: key);

  bool? preguntaEnabled;

  bool buttonEnabled = false;

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
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildOptions(),
                  );
                },
              ),
              const SizedBox(height: 20 - 12),
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  if(checkeds.length == pregunta.opciones!.length){
                    buttonEnabled = true;
                  }else{
                    buttonEnabled = false;
                  }
                  
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                          color: buttonEnabled ? null : const Color(0xFF6F6F6F),
                        ),
                        padding: EdgeInsets.zero,
                        iconSize: 23,
                        onPressed: buttonEnabled ? () {
                          if(!preguntaFinalizada){
                            preguntaFinalizada = true;
                            reconstruye.value = !reconstruye.value;
                            BlocProvider.of<RealiazarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!));
                          }
                        } : null,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 17 - 12),
            ],
          ),
        );
      },
    );
  }

  List<int> idsNoChecked = [];
  List<int> idsSiChecked = [];

  Map<int, bool?> checkeds = Map();

  List<Widget> _buildOptions() {
    List<Widget> list = [];
    list.add(Row(
      children: const [SizedBox(width: 14), Text("Si"), SizedBox(width: 26), Text("No")],
    ));
    pregunta.opciones!.asMap().forEach((index, option) {
      list.add(Row(
        children: [
          Checkbox(
            visualDensity: VisualDensity.compact,
            value: checkeds[option.id] == true,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.isNotEmpty && states.first == MaterialState.disabled) {
                return const Color(0xFF6F6F6F);
              }
              return carMindAccent2Color;
            }),
            onChanged: preguntaEnabled!
                ? (value) {
                    if (checkeds[option.id!] == true) {
                      checkeds.remove(option.id!);
                    } else {
                      checkeds[option.id!] = value;
                    }
                    reconstruye.value = !reconstruye.value;
                  }
                : null,
          ),
          CustomCheckbox(
            value: checkeds[option.id] == false,
            visualDensity: VisualDensity.compact,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.isNotEmpty && states.first == MaterialState.disabled) {
                return const Color(0xFF6F6F6F);
              }
              if (states.isNotEmpty && states.first == MaterialState.selected) {
                return const Color(0xFFFF0202);
              }
              return carMindAccent2Color;
            }),
            onChanged: preguntaEnabled!
                ? (value) {
                    if (checkeds[option.id!] == false) {
                      checkeds.remove(option.id!);
                    } else {
                      checkeds[option.id!] = !value!;
                    }
                    reconstruye.value = !reconstruye.value;
                  }
                : null,
          ),
          Text(
            option.texto!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ));
    });
    return list;
  }
}
