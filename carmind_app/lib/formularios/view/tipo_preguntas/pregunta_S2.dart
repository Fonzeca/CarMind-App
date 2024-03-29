import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class PreguntaS2 extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final int? respuesta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaS2({Key? key, required this.pregunta, this.respuesta}) : super(key: key);

  bool? preguntaEnabled;

  bool buttonEnabled = true;

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
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                          color: listIds.isNotEmpty ? null : const Color(0xFF6F6F6F),
                        ),
                        padding: EdgeInsets.zero,
                        iconSize: 23,
                        onPressed: listIds.isNotEmpty
                            ? () {
                                BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                preguntaFinalizada = true;
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
            value.opcion!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      );
      list.add(widget);
    });
    list.removeAt(0);
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
      resOpcion.tick_correcto = listIds.contains(opcion.id!);
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
