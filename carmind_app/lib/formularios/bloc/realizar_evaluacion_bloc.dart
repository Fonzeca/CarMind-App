import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


import '../../constants.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';

part 'realizar_evaluacion_event.dart';
part 'realizar_evaluacion_state.dart';

class RealizarEvaluacionBloc extends HydratedBloc<RealizarEvaluacionEvent, RealizarEvaluacionState>{
  Evaluacion? evaluacion;

  EvaluacionTerminadaPojo? evaluacionTerminada;

  List<int> respondidas = [];

  List<String> preguntas = [];

  ApiClient? api;

  RealizarEvaluacionBloc()
      : super(const RealizarEvaluacionState(
            evaluacionIniciada: false, evaluacionTerminada: false, preguntaActual: -1, preguntasRespondidas: [], mandandoEvaluacion: false, isFieldEmptyError: true, isFieldNotNumberError: false)) {
    api = ApiClient(staticDio!);

    on<ValidarTextFieldEvent>((event, emit) async {
        emit(state.copyWith(
           isFieldEmptyError: event.isFieldEmptyError,
           isFieldNotNumberError: event.isFieldNotNumberError
        ));

    });

    on<IniciarEvaluacionEvent>((event, emit) {
      //Steamos en 0 las variables
      emit(state.copyWith(
          pMandandoEvaluacion: false, pEvaluacionTerminada: false, pEvaluaconIniciada: false, pPreguntaActual: -1, pPreguntasRespondidas: [], restoredData: null, evaluacion: null));
      
      respondidas = [];
      evaluacion = event.evaluacion;
      evaluacionTerminada = EvaluacionTerminadaPojo();
      evaluacionTerminada!.vehiculo_id = event.vehiculo.id;
      evaluacionTerminada!.respuestas = [];

      //Obtenemos la proxima pregunta
      int proxima = obtenerPreguntaActual();

      //Scrolleamos a la primera pregunta
      FormularioPreguntas.scrollToId?.animateTo(proxima.toString(), duration: const Duration(milliseconds: 300), curve: Curves.ease);

      emit(state.copyWith(pEvaluaconIniciada: true, pEvaluacionTerminada: false, pPreguntaActual: proxima, pPreguntasRespondidas: respondidas));
    });

    on<FinalizarPreguntaEvent>((event, emit) {
      respondidas.add(event.preguntaId);
      evaluacionTerminada!.respuestas!.add(event.respuesta);

      int proxima = obtenerPreguntaActual();

      Future.delayed(const Duration(milliseconds: 100), () {
        FormularioPreguntas.scrollToId?.animateTo(proxima.toString(), duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });

      emit(state.copyWith(pPreguntasRespondidas: respondidas, pPreguntaActual: proxima, evaluacion: evaluacionTerminada));
    });

    on<FinalizarEvaluacionEvent>((event, emit) async {
      emit(state.copyWith(pMandandoEvaluacion: true));

      var sh = await SharedPreferences.getInstance();

      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");
        var log = LogEvaluacionTerminadaPojo()
          ..evaluacionId = evaluacion!.id!
          ..fecha = DateFormat(dateTimeFormat).format(DateTime.now())
          ..respuesta = evaluacionTerminada!;

        box.add(log);
      } else {
        await api!.realizarEvaluacion(evaluacion!.id!, evaluacionTerminada!);
      }

      evaluacionTerminada = null;
      respondidas = [];
      evaluacion = null;
      
      emit(state.copyWith(
          pMandandoEvaluacion: false, pEvaluacionTerminada: true,pEvaluaconIniciada: false, pPreguntaActual: -1, pPreguntasRespondidas: [], evaluacion: evaluacionTerminada, restoredData: null));

    });

    on<RestoreDataEvent>((event, emit) async {
      emit(state.copyWith(restoredData: event.restoredData));
    });
}

  int obtenerPreguntaActual() {
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
  Map<String, dynamic>? toJson(RealizarEvaluacionState state) => state.toMap();
}
