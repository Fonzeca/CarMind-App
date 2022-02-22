import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:carmind_app/formularios/view/formulario.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'realiazar_evaluacion_event.dart';
part 'realiazar_evaluacion_state.dart';

class RealiazarEvaluacionBloc extends Bloc<RealiazarEvaluacionEvent, RealiazarEvaluacionState> {
  Evaluacion? evaluacion;

  EvaluacionTerminadaPojo? evaluacionTerminada;

  List<int> respondidas = [];

  ApiClient? api;

  RealiazarEvaluacionBloc()
      : super(const RealiazarEvaluacionState(
            evaluacionIniciada: false,
            evaluacionTerminada: false,
            preguntaActual: -1,
            preguntasRespondidas: [],
            seccionesTerminadas: [],
            mandandoEvaluacion: false)) {
    api = ApiClient(staticDio!);

    on<IniciarEvaluacionEvent>((event, emit) {
      respondidas = [];

      evaluacion = event.evaluacion;

      evaluacionTerminada = EvaluacionTerminadaPojo();
      evaluacionTerminada!.vehiculo_id = 71;
      evaluacionTerminada!.respuestas = [];

      int proxima = obtenerPreguntaActual();

      //Scrolleamos a la primera pregunta
      FormularioPreguntas.controller!.scrollToIndex(proxima, preferPosition: AutoScrollPosition.middle);

      emit(state.copyWith(pEvaluaconIniciada: true, pEvaluacionTerminada: false, pPreguntaActual: proxima, pPreguntasRespondidas: respondidas));
    });

    on<FinalizarPreguntaEvent>((event, emit) {
      respondidas.add(event.preguntaId);
      evaluacionTerminada!.respuestas!.add(event.respuesta);

      int proxima = obtenerPreguntaActual();

      Future.delayed(const Duration(milliseconds: 200), () {
        FormularioPreguntas.controller!.scrollToIndex(proxima, preferPosition: AutoScrollPosition.middle);
      });

      emit(state.copyWith(pPreguntasRespondidas: respondidas, pPreguntaActual: proxima, pSeccionesTermiandas: obtenerSeccionesTerminadas()));
    });
    on<FinalizarEvaluacionEvent>((event, emit) async {
      emit(state.copyWith(pMandandoEvaluacion: true));

      log(evaluacionTerminada!.toJson().toString());

      await api!.realizarEvaluacion(196, evaluacionTerminada!).onError((error, stackTrace) {
        log("$error");
      });

      emit(state.copyWith(pMandandoEvaluacion: false, pEvaluacionTerminada: true));

      respondidas = [];
      evaluacion = null;
      evaluacionTerminada = null;
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

  List<int> obtenerSeccionesTerminadas() {
    List<int> list = [];
    evaluacion!.secciones!.asMap().forEach((i, seccion) {
      if (respondidas.toSet().containsAll(seccion.preguntas!.map((e) => e.id).toList())) {
        list.add(seccion.id!);
      }
    });
    return list;
  }
}
