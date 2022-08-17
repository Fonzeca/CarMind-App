// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/api/pojo/profile/sync_view.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

part 'offline_event.dart';
part 'offline_state.dart';

class OfflineBloc extends HydratedBloc<OfflineEvent, OfflineState> {
  late ApiClient api;

  OfflineBloc() : super(OfflineState(newLogsEvaluaciones: [], newLogsUso: [], logEvaluaciones: [])) {
    api = ApiClient(staticDio!);

    on<GetOfflineData>((event, emit) async {
      if (OfflineModeService.isOffline()) return;

      var offlineData = await api.obtenerDatosOffline();
      emit(state.copyWith(
          loggedUser: offlineData.loggedUser,
          idVehiculoActual: offlineData.idVehiculoActual,
          vehiculos: offlineData.vehiculos,
          evaluaciones: offlineData.evaluaciones,
          logEvaluaciones: offlineData.logEvaluacion));
    });

    on<IniciarUsoVehiculoOffline>((event, emit) async {
      if (state.vehiculos == null) {
        EasyLoading.showError(noVehicles, duration: const Duration(seconds: 5));
      }

      int vehicleToUseIndex = state.vehiculos!.indexWhere((vehicle) => vehicle.id == event.vehiculoId);
      if (vehicleToUseIndex == -1) {
        EasyLoading.showError(noVehicle, duration: const Duration(seconds: 3));
        return;
      }

      if (state.idVehiculoActual != null) {
        var dateForm = DateFormat(dateTimeFormat, 'es_AR');
        String todayDate = dateForm.format(DateTime.now());
        int logUsoIndex = state.newLogsUso.indexWhere((logUso) => logUso.fechaFin == null && logUso.vehiculoId == event.vehiculoId);
        if (logUsoIndex != -1) state.newLogsUso[logUsoIndex].fechaFin = todayDate;
      }

      state.vehiculos![vehicleToUseIndex].en_uso = true;
      state.idVehiculoActual = state.vehiculos![vehicleToUseIndex].id;

      var dateForm = DateFormat(dateTimeFormat, 'es_AR');
      String todayDate = dateForm.format(DateTime.now());
      LogUso newLogUso = LogUso(usuarioId: state.loggedUser!.id, vehiculoId: state.vehiculos![vehicleToUseIndex].id, fechaInicio: todayDate);
      state.newLogsUso.add(newLogUso);

      emit(state.copyWith(newLogsUso: state.newLogsUso, vehiculos: state.vehiculos!));
    });

    on<TerminarUsoVehiculoOffline>((event, emit) async {
      if (state.vehiculos == null) {
        EasyLoading.showError(noVehicles, duration: const Duration(seconds: 5));
      }

      int vehicleToUnuseIndex = state.vehiculos!.indexWhere((vehicle) => vehicle.id == event.vehiculoId);

      if (vehicleToUnuseIndex == -1) {
        EasyLoading.showError(noVehicle, duration: const Duration(seconds: 3));
        return;
      }
      state.vehiculos![vehicleToUnuseIndex].en_uso = false;
      state.idVehiculoActual = null;

      if (event.deleteLog) {
        state.newLogsUso.removeWhere((logUso) => logUso.fechaFin == null && logUso.vehiculoId == event.vehiculoId);
      } else {
        var dateForm = DateFormat(dateTimeFormat, 'es_AR');
        String todayDate = dateForm.format(DateTime.now());
        int logUsoIndex = state.newLogsUso.indexWhere((logUso) => logUso.fechaFin == null && logUso.vehiculoId == event.vehiculoId);
        if (logUsoIndex != -1) state.newLogsUso[logUsoIndex].fechaFin = todayDate;
      }

      emit(state.copyWith(newLogsUso: state.newLogsUso, vehiculos: state.vehiculos!));
    });

    on<RealizarEvaluacionOffline>((event, emit) async {
      Evaluacion evaluation = state.evaluaciones!.firstWhere((evaluation) => evaluation.id == event.evaluacionId, orElse: () => Evaluacion());
      if (evaluation.id == null) {
        EasyLoading.showError(noEvaluation, duration: const Duration(seconds: 3));
        return;
      }

      Vehiculo vehicle = state.vehiculos!.firstWhere((vehicle) => vehicle.id == state.idVehiculoActual, orElse: () => Vehiculo());
      if (vehicle.id == null) {
        EasyLoading.showError(noVehicle, duration: const Duration(seconds: 3));
        return;
      }

      if (state.evaluaciones == null) {
        EasyLoading.showError(noEvaluations, duration: const Duration(seconds: 3));
        return;
      }

      if (state.evaluaciones!.contains(evaluation)) {
        List<int?> idsPreguntasEvaluacion = getIdsPreguntasOfEvaluacion(evaluation);
        List<int?> idsPreguntasRespuestas = getIdsPreguntasRespuestas(event.evaluacionTerminada);

        if (listEquals(idsPreguntasEvaluacion, idsPreguntasRespuestas)) {
          var dateForm = DateFormat(dateTimeFormat, 'es_AR');
          String todayDate = dateForm.format(DateTime.now());
          LogEvaluacion logEvaluacion = LogEvaluacion();
          logEvaluacion.nombre_evaluacion = evaluation.titulo;
          logEvaluacion.evaluacion_id = event.evaluacionId;
          logEvaluacion.fecha = todayDate;
          logEvaluacion.vehiculo_id = state.idVehiculoActual;
          logEvaluacion.usuario_id = state.loggedUser!.id;
          logEvaluacion.respuestas = event.evaluacionTerminada.respuestas;

          state.newLogsEvaluaciones.add(logEvaluacion);
          state.logEvaluaciones.add(logEvaluacion);
          emit(state.copyWith(newLogsEvaluaciones: state.newLogsEvaluaciones));
        } else {
          EasyLoading.showError(answersNotMatching, duration: const Duration(seconds: 3));
        }
      } else {
        EasyLoading.showError(noEvaluationAssigned, duration: const Duration(seconds: 3));
      }
    });

    on<SyncOfflineData>((event, emit) async {
      try {
        await api.sincronizarDatos(SyncView(logsUso: state.newLogsUso, logsEvaluaciones: state.newLogsEvaluaciones));
        OfflineModeService.setOnline();
        state.newLogsUso.removeWhere((log) => log.fechaFin != null);
        emit(state.copyWith(newLogsUso: state.newLogsUso, logEvaluaciones: []));
      } catch (e) {
        if (e is SocketException) {}
      }
    });
  }

  List<int?> getIdsPreguntasOfEvaluacion(Evaluacion e) {
    List<PreguntaPojo> preguntasDb = e.preguntas!;
    return preguntasDb.map((e) => e.id).toList();
  }

  List<int?> getIdsPreguntasRespuestas(EvaluacionTerminadaPojo e) {
    return e.respuestas!.map((x) => x.pregunta_id).toList();
  }

  @override
  OfflineState? fromJson(Map<String, dynamic> json) => OfflineState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(OfflineState state) => state.toMap();
}
