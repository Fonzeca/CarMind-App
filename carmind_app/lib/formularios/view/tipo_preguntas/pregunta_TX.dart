import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';

class PreguntaTX extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final String? respuesta;
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaTX({Key? key, required this.pregunta, this.respuesta}) : super(key: key);

  bool? preguntaEnabled;

  bool preguntaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        String? savedResponse =_getSavedResponse(state.evaluacion, pregunta.id);
        if (savedResponse != null) {
          controller.text = savedResponse;
          preguntaFinalizada = true;
        }
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);
        return PreguntaBase(
          preguntaEnabled: preguntaEnabled!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    pregunta.descripcion!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: TextField(
                      minLines: null,
                      maxLines: null,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.top,
                      controller: controller,
                      enabled: preguntaEnabled!,
                      onChanged: (value) {
                        preguntaFinalizada = false;
                        reconstruye.value = !reconstruye.value;
                      },
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      expands: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        hintText: "Añadir nota...",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20 - 12),
                  ValueListenableBuilder(
                    valueListenable: reconstruye,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: preguntaEnabled!
                                ? () {
                                    preguntaFinalizada = true;
                                    reconstruye.value = !reconstruye.value;
                                    BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                              color: preguntaEnabled! ? null : const Color(0xFF6F6F6F),
                            ),
                            padding: EdgeInsets.zero,
                            iconSize: 23,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16 - 12)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  RespuestaPojo setearRespuesta() {
    RespuestaPojo res = RespuestaPojo();
    res.pregunta_id = pregunta.id;
    res.texto = controller.text;
    return res;
  }
}

String? _getSavedResponse(EvaluacionTerminadaPojo? evaluacion, int? preguntaId) {
  if(evaluacion != null && evaluacion.respuestas != null) return evaluacion.respuestas!.firstWhere((respuesta) => respuesta.pregunta_id == preguntaId, orElse: () => RespuestaPojo()).texto;
}
