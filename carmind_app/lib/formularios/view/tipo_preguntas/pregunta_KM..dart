import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/bloc/pregunta_KM_bloc.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreguntaKM extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaKM({Key? key, required this.pregunta}) : super(key: key);

  final PreguntaKMBloc textBloc = PreguntaKMBloc();

  bool? preguntaEnabled;

  bool preguntaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        String? savedResponse = state.isRestoredData ? _getSavedResponse(state.evaluacion, pregunta.id) : null;
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
                    child: StreamBuilder(
                        stream: textBloc.textStream,
                        builder: (ctxt, AsyncSnapshot<String> textStream) {
                          return TextField(
                            minLines: null,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.top,
                            controller: controller,
                            enabled: preguntaEnabled!,
                            onChanged: (value) {
                              preguntaFinalizada = false;
                              reconstruye.value = !reconstruye.value;
                              textBloc.updateText(value);
                            },
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                hintText: "Añadir kilometraje...",
                                errorText: textStream.hasError ? textStream.error.toString() : null,
                                errorStyle: TextStyle(color: textBloc.errorColor),
                                errorBorder: _renderBorder(state),
                                enabledBorder: _renderBorder(state),
                                focusedErrorBorder: _renderBorder(state)),
                          );
                        }),
                  ),
                  const SizedBox(height: 20 - 12),
                  ValueListenableBuilder(
                    valueListenable: reconstruye,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: preguntaEnabled! && !textBloc.hasError
                                ? () {
                                    preguntaFinalizada = true;
                                    reconstruye.value = !reconstruye.value;
                                    BlocProvider.of<RealizarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                              color: preguntaEnabled! && !state.isFieldNotNumberError ? null : const Color(0xFF6F6F6F),
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
    return RespuestaPojo(pregunta_id: pregunta.id, texto: controller.text);
  }

  UnderlineInputBorder _renderBorder(RealizarEvaluacionState state) => UnderlineInputBorder(
        borderSide: BorderSide(color: textBloc.errorColor, width: 1),
      );
}

String? _getSavedResponse(EvaluacionTerminadaPojo? evaluacion, int? preguntaId) {
  if (evaluacion != null && evaluacion.respuestas != null)
    return evaluacion.respuestas!.firstWhere((respuesta) => respuesta.pregunta_id == preguntaId, orElse: () => RespuestaPojo()).texto;
}
