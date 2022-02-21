import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/view/formulario.dart';
import 'package:equatable/equatable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'realiazar_evaluacion_event.dart';
part 'realiazar_evaluacion_state.dart';

class RealiazarEvaluacionBloc extends Bloc<RealiazarEvaluacionEvent, RealiazarEvaluacionState> {
  Evaluacion? evaluacion;

  List<int> respondidas = [];


  RealiazarEvaluacionBloc()
      : super(const RealiazarEvaluacionState(evaluacionIniciada: false, evaluacionTerminada: false, preguntaActual: -1, preguntasRespondidas: [])) {
    on<IniciarEvaluacionEvent>((event, emit) {
      evaluacion = event.evaluacion;
      respondidas = [];


      int proxima = obtenerPreguntaActual();

      FormularioPreguntas.controller!.scrollToIndex(proxima, preferPosition: AutoScrollPosition.middle);

      emit(state.copyWith(pEvaluaconIniciada: true, pEvaluacionTerminada: false, pPreguntaActual: proxima, pPreguntasRespondidas: respondidas));
    });
    on<FinalizarPreguntaEvent>((event, emit) {
      respondidas.add(event.preguntaId);
      int proxima = obtenerPreguntaActual();
      FormularioPreguntas.controller!.scrollToIndex(proxima, preferPosition: AutoScrollPosition.middle);

      bool finalizaEvaluacion = proxima == -1;

      emit(state.copyWith(pPreguntasRespondidas: respondidas, pPreguntaActual: proxima, pEvaluacionTerminada: finalizaEvaluacion));
    });
  }

  int obtenerPreguntaActual() {
    int proxima = -1;

    evaluacion!.secciones!.asMap().forEach((i, seccion) {
      if (proxima != -1) {
        return;
      }
      seccion.preguntas!.asMap().forEach((ii, pregunta) {
        if (proxima == -1 && !respondidas.contains(pregunta.id)) {
          proxima = pregunta.id!;
          return;
        }
      });
    });
    return proxima;
  }
}
