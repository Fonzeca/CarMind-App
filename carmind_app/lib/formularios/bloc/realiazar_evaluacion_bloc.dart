import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/formularios/view/formulario.dart';
import 'package:carmind_app/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      evaluacionTerminada!.vehiculo_id = event.vehiculo.id;
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

      var sh = await SharedPreferences.getInstance();

      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");
        var log = LogEvaluacionTerminadaPojo()
          ..evaluacionId = evaluacion!.id!
          ..fecha = DateFormat("dd/MM/yyyy HH:mm:ss").format(DateTime.now())
          ..respuesta = evaluacionTerminada!;

        box.add(log);
      } else {
        await api!.realizarEvaluacion(evaluacion!.id!, evaluacionTerminada!).catchError((obj) {
          switch (obj.runtimeType) {
            case DioError:
              // Here's the sample to get the failed response error code and message
              final res = (obj as DioError).response;
              log("Got error : ${res!.statusCode} -> ${res.statusMessage}");
              break;
            default:
              break;
          }
        });
      }

      emit(state.copyWith(
          pMandandoEvaluacion: false,
          pEvaluacionTerminada: true,
          pEvaluaconIniciada: false,
          pPreguntaActual: -1,
          pPreguntasRespondidas: [],
          pSeccionesTermiandas: []));

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
