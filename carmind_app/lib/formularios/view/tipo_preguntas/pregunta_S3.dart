import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';

class PreguntaS3 extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final int? respuesta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  TextEditingController controller = TextEditingController();

  PreguntaS3({Key? key, required this.pregunta, this.respuesta}) : super(key: key);

  bool? preguntaEnabled;

  bool buttonFinishEnabled = false;

  bool? tickCorrecto;

  bool terminaNota = false;
  bool muestraNota = false;

  bool preguntaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        bool? savedResponse = state.isRestoredData ? _getSavedResponse(state.evaluacion, pregunta.id) : null;
        if (savedResponse != null) {
          tickCorrecto = savedResponse;
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
              const SizedBox(height: 20 - 13),
              _buildNota(),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  if (muestraNota && !preguntaFinalizada) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20 - 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: preguntaEnabled!
                                ? () async {
                                    terminaNota = true;
                                    muestraNota = true;
                                    reconstruye.value = !reconstruye.value;

                                    await Future.delayed(const Duration(milliseconds: 200));

                                    preguntaFinalizada = true;
                                    BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                    reconstruye.value = !reconstruye.value;
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              terminaNota ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                              color: preguntaEnabled! ? null : const Color(0xFF6F6F6F),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20 - 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: preguntaEnabled!
                              ? () async {
                                  tickCorrecto = false;
                                  reconstruye.value = !reconstruye.value;
                                  await Future.delayed(const Duration(milliseconds: 200));
                                  muestraNota = true;
                                  terminaNota = false;
                                  preguntaFinalizada = false;
                                  reconstruye.value = !reconstruye.value;
                                }
                              : null,
                          icon: SvgPicture.asset(
                            tickCorrecto == false ? "assets/cruz_fill.svg" : "assets/cruz_empty.svg",
                            color: preguntaEnabled! ? null : const Color(0xFF6F6F6F),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        IconButton(
                          onPressed: preguntaEnabled!
                              ? () {
                                  tickCorrecto = true;
                                  muestraNota = false;
                                  preguntaFinalizada = true;
                                  BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                  reconstruye.value = !reconstruye.value;
                                }
                              : null,
                          icon: SvgPicture.asset(
                            tickCorrecto == true ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                            color: preguntaEnabled! ? null : const Color(0xFF6F6F6F),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16 - 10),
            ],
          ),
        );
      },
    );
  }

  ValueListenableBuilder<bool> _buildNota() {
    return ValueListenableBuilder(
      valueListenable: reconstruye,
      builder: (context, value, child) {
        if (muestraNota) {
          return Container(
            width: double.infinity,
            height: 64,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              minLines: null,
              maxLines: null,
              controller: controller,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              expands: true,
              enabled: !preguntaFinalizada,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                hintText: "Añadir nota...",
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  RespuestaPojo setearRespuesta() {
    RespuestaPojo res = RespuestaPojo();
    res.pregunta_id = pregunta.id;
    res.tick_correcto = tickCorrecto;
    if (!tickCorrecto!) {
      res.texto = controller.text;
    }
    return res;
  }
}

bool? _getSavedResponse(EvaluacionTerminadaPojo? evaluacion, int? preguntaId) {
  if(evaluacion != null && evaluacion.respuestas != null) return evaluacion.respuestas!.firstWhere((respuesta) => respuesta.pregunta_id == preguntaId, orElse: () => RespuestaPojo()).tick_correcto;
}