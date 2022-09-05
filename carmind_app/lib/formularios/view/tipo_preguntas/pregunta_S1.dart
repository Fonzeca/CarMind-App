import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';

class PreguntaS1 extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final int? respuesta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaS1({Key? key, required this.pregunta, this.respuesta}) : super(key: key);

  bool? preguntaEnabled;

  bool buttonEnabled = false;

  bool preguntaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        bool? savedResponse = state.isRestoredData ? _getSavedResponse(state.evaluacion, pregunta.id) : null;
        if (savedResponse != null) {
          preguntaFinalizada = true;
        }
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);
        return PreguntaBase(
          preguntaEnabled: preguntaEnabled!,
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
                  if (checkeds.length == pregunta.opciones!.length) {
                    buttonEnabled = true;
                  } else {
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
                        onPressed: buttonEnabled
                            ? () {
                                if (!preguntaFinalizada) {
                                  preguntaFinalizada = true;
                                  reconstruye.value = !reconstruye.value;
                                  BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                }
                              }
                            : null,
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

  Map<int, bool?> checkeds = {};

  List<Widget> _buildOptions() {
    List<Widget> list = [];
    list.add(Row(
      children: const [SizedBox(width: 23), Text("Si"), SizedBox(width: 26), Text("No")],
    ));
    pregunta.opciones!.asMap().forEach((index, option) {
      list.add(Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
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
              option.opcion!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ));
    });
    return list;
  }

  @override
  RespuestaPojo setearRespuesta() {
    RespuestaPojo res = RespuestaPojo();
    res.pregunta_id = pregunta.id;

    List<RespuestaOpcionPojo> list = [];
    for (var opcion in pregunta.opciones!) {
      RespuestaOpcionPojo resOpcion = RespuestaOpcionPojo();
      resOpcion.opcion_id = opcion.id;
      resOpcion.tick_correcto = checkeds[opcion.id!];
      list.add(resOpcion);
    }

    res.opciones = list;
    return res;
  }
}

bool? _getSavedResponse(EvaluacionTerminadaPojo? evaluacion, int? preguntaId) {
  if (evaluacion != null && evaluacion.respuestas != null)
    return evaluacion.respuestas!.firstWhere((respuesta) => respuesta.pregunta_id == preguntaId, orElse: () => RespuestaPojo()).tick_correcto;
}
