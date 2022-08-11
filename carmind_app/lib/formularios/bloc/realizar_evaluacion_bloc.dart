import 'dart:convert';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'realizar_evaluacion_event.dart';
part 'realizar_evaluacion_state.dart';

class RealizarEvaluacionBloc extends HydratedBloc<RealizarEvaluacionEvent, RealizarEvaluacionState> {
  Evaluacion? evaluacion;

  EvaluacionTerminadaPojo? evaluacionTerminada;

  List<int> respondidas = [];

  List<String> preguntas = [];

  ApiClient? api;

  RealizarEvaluacionBloc()
      : super(const RealizarEvaluacionState(
            evaluacionIniciada: false,
            evaluacionTerminada: false,
            preguntaActual: -1,
            preguntasRespondidas: [],
            mandandoEvaluacion: false,
            isFieldEmptyError: true,
            isFieldNotNumberError: false,
            isRestoredData: false)) {
    api = ApiClient(staticDio!);

    on<IniciarEvaluacionEvent>((event, emit) {
      //Steamos en 0 las variables
      emit(state.copyWith(
          pMandandoEvaluacion: false,
          pEvaluacionTerminada: false,
          pEvaluaconIniciada: false,
          pPreguntaActual: -1,
          pPreguntasRespondidas: [],
          resetCache: true));

      respondidas = [];
      evaluacion = event.evaluacion;
      evaluacionTerminada = EvaluacionTerminadaPojo();
      evaluacionTerminada!.vehiculo_id = event.vehiculo.id;
      evaluacionTerminada!.respuestas = [];

      //Obtenemos la proxima pregunta
      int proxima = obtenerPreguntaNoRespondida();

      //Scrolleamos a la primera pregunta
      FormularioPreguntas.scrollToId?.animateTo(proxima.toString(), duration: const Duration(milliseconds: 300), curve: Curves.ease);

      emit(state.copyWith(pEvaluaconIniciada: true, pEvaluacionTerminada: false, pPreguntaActual: proxima, pPreguntasRespondidas: respondidas));
    });

    on<FinalizarPreguntaEvent>((event, emit) {
      //Se hace esto para evitar respuestas repetidas
      if (respondidas.contains(event.preguntaId)) {
        int index = evaluacionTerminada!.respuestas!.indexWhere((element) => element.pregunta_id == event.preguntaId);
        evaluacionTerminada!.respuestas![index] = event.respuesta;
      } else {
        respondidas.add(event.preguntaId);
        evaluacionTerminada!.respuestas!.add(event.respuesta);
      }

      int proxima = obtenerPreguntaNoRespondida();

      Future.delayed(const Duration(milliseconds: 100), () {
        FormularioPreguntas.scrollToId?.animateTo(proxima.toString(), duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });

      emit(state.copyWith(
          pPreguntasRespondidas: respondidas,
          pPreguntaActual: proxima,
          evaluacion: evaluacionTerminada,
          isRestoredData: event.isRestoredData ? true : false));
    });

    on<FinalizarEvaluacionEvent>((event, emit) async {
      emit(state.copyWith(pMandandoEvaluacion: true));

      var sh = await SharedPreferences.getInstance();

      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        /* var box = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");
        var log = LogEvaluacionTerminadaPojo()
          ..evaluacionId = evaluacion!.id!
          ..fecha = DateFormat(dateTimeFormat).format(DateTime.now())
          ..respuesta = evaluacionTerminada!;

        box.add(log); */
      } else {
        await api!.realizarEvaluacion(evaluacion!.id!, evaluacionTerminada!);
      }

      evaluacionTerminada = null;
      respondidas = [];
      evaluacion = null;

      emit(state.copyWith(
          pMandandoEvaluacion: false,
          pEvaluacionTerminada: true,
          pEvaluaconIniciada: false,
          pPreguntaActual: -1,
          pPreguntasRespondidas: [],
          resetCache: true));
    });

    on<RestoreDataEvent>((event, emit) async {
      evaluacion = event.evaluacion;
      evaluacionTerminada = state.evaluacion;
      respondidas = state.evaluacion!.respuestas!.map((respuesta) => respuesta.pregunta_id!).toList();
      RespuestaPojo respuesta = RespuestaPojo();
      var imageBytes = await event.restoredData.readAsBytes();
      respuesta.pregunta_id = obtenerPreguntaNoRespondida();
      respuesta.base64_image = base64Encode(imageBytes);
      respuesta.texto = event.restoredData.name;
      add(FinalizarPreguntaEvent(respuesta.pregunta_id!, respuesta, isRestoredData: true));
    });

    on<AbortRestoreDataEvent>((event, emit) async {
      emit(state.copyWith(isRestoredData: false));
    });
  }

  int obtenerPreguntaNoRespondida() {
    int proxima = -1;
    evaluacion!.preguntas!.asMap().forEach((ii, pregunta) {
      if (proxima == -1 && !respondidas.contains(pregunta.id)) {
        proxima = pregunta.id!;
        return;
      }
    });
    return proxima;
  }

  @override
  RealizarEvaluacionState? fromJson(Map<String, dynamic> json) => RealizarEvaluacionState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(RealizarEvaluacionState state) => evaluacionTerminada != null ? state.toMap() : null;
}
