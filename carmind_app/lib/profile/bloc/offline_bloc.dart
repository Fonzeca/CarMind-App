// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/api/pojo/profile/sync_view.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/services/services.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../../formularios/formularios.dart';

part 'offline_event.dart';
part 'offline_state.dart';

class OfflineBloc extends HydratedBloc<OfflineEvent, OfflineState> {
  late ApiClient api;

  OfflineBloc() : super(const OfflineState(newLogsEvaluaciones: [], newLogsUso: [], logEvaluaciones: [], flag: false)) {
    api = ApiClient(staticDio!);

    on<GetOfflineData>((event, emit) async {
      if (OfflineModeService.isOffline()) return;

      if (!OfflineModeService.offline && (state.newLogsEvaluaciones.isNotEmpty || state.newLogsUso.isNotEmpty)) {
        add(SyncOfflineData(getDatosOffline: true, context: event.context));
      } else {
        var offlineData = await api.obtenerDatosOffline();
        emit(state.copyWith(
            loggedUser: offlineData.loggedUser,
            idVehiculoActual: offlineData.idVehiculoActual,
            vehiculos: offlineData.vehiculos,
            evaluaciones: offlineData.evaluaciones,
            logEvaluaciones: offlineData.logEvaluacion));

        BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent(event.context));
        BlocProvider.of<FormularioBloc>(event.context).add(GetLastFormLogs(event.context));
      }
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
        if (logUsoIndex != -1) state.newLogsUso[logUsoIndex] = state.newLogsUso[logUsoIndex].copyWith(fechaFin: todayDate);
      }

      state.vehiculos![vehicleToUseIndex].en_uso = true;

      var dateForm = DateFormat(dateTimeFormat, 'es_AR');
      String todayDate = dateForm.format(DateTime.now());
      LogUso newLogUso = LogUso(usuarioId: state.loggedUser!.id, vehiculoId: state.vehiculos![vehicleToUseIndex].id, fechaInicio: todayDate);
      List<LogUso> tempNewLogUsoList = List.from(state.newLogsUso);
      tempNewLogUsoList.add(newLogUso);

      emit(state.copyWith(newLogsUso: tempNewLogUsoList, vehiculos: state.vehiculos!, idVehiculoActual: state.vehiculos![vehicleToUseIndex].id));
      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent(event.context));
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

      if (event.deleteLog) {
        state.newLogsUso.removeWhere((logUso) => logUso.fechaFin == null && logUso.vehiculoId == event.vehiculoId);
      } else {
        var dateForm = DateFormat(dateTimeFormat, 'es_AR');
        String todayDate = dateForm.format(DateTime.now());
        int logUsoIndex = state.newLogsUso.indexWhere((logUso) => logUso.fechaFin == null && logUso.vehiculoId == event.vehiculoId);
        if (logUsoIndex != -1) state.newLogsUso[logUsoIndex] = state.newLogsUso[logUsoIndex].copyWith(fechaFin: todayDate);
      }

      emit(state.copyWith(newLogsUso: state.newLogsUso, vehiculos: state.vehiculos!, idVehiculoActual: 0));

      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent(event.context));
    });

    on<RealizarEvaluacionOffline>((event, emit) async {
      Evaluacion evaluation = state.evaluaciones!.firstWhere((evaluation) => evaluation.id == event.evaluacionId, orElse: () => Evaluacion());
      if (evaluation.id == null) {
        EasyLoading.showError(noEvaluation, duration: const Duration(seconds: 3));
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
          LogEvaluacion logEvaluacion = LogEvaluacion(
              nombre_evaluacion: evaluation.titulo,
              evaluacion_id: event.evaluacionId,
              fecha: todayDate,
              vehiculo_id: state.idVehiculoActual,
              usuario_id: state.loggedUser!.id,
              respuestas: event.evaluacionTerminada.respuestas);

          List<LogEvaluacion> tempNewLogsEvaluacionesList = List.from(state.newLogsEvaluaciones);
          tempNewLogsEvaluacionesList.add(logEvaluacion);
          List<LogEvaluacion> tempLogsEvaluacionesList = List.from(state.logEvaluaciones);
          tempLogsEvaluacionesList.add(logEvaluacion);

          int vehiculoIndex = state.vehiculos!.indexWhere((vehiculo) => vehiculo.id == state.idVehiculoActual);
          int pendienteIndex = state.vehiculos![vehiculoIndex].pendientes!.indexWhere((pendiente) => pendiente.id == event.evaluacionId);
          if (pendienteIndex != -1) {
            state.vehiculos![vehiculoIndex].pendientes![pendienteIndex] =
                state.vehiculos![vehiculoIndex].pendientes![pendienteIndex].copyWith(pendiente: false);
          }

          emit(state.copyWith(
              newLogsEvaluaciones: tempNewLogsEvaluacionesList, logEvaluaciones: tempLogsEvaluacionesList, vehiculos: state.vehiculos));
        } else {
          EasyLoading.showError(answersNotMatching, duration: const Duration(seconds: 3));
        }
      } else {
        EasyLoading.showError(noEvaluationAssigned, duration: const Duration(seconds: 3));
      }

      BlocProvider.of<RealizarEvaluacionBloc>(event.context).add(UpdateEvaluacion());
      BlocProvider.of<VehiculoBloc>(event.context).add(GetCurrent(event.context));
    });

    on<SyncOfflineData>((event, emit) async {
      try {
        await api.sincronizarDatos(SyncView(logsUso: state.newLogsUso, logsEvaluaciones: state.newLogsEvaluaciones));

        if (event.getDatosOffline) {
          var offlineData = await api.obtenerDatosOffline();
          state.newLogsUso.removeWhere((log) => log.fechaFin != null);
          emit(state.copyWith(
              loggedUser: offlineData.loggedUser,
              idVehiculoActual: offlineData.idVehiculoActual,
              vehiculos: offlineData.vehiculos,
              evaluaciones: offlineData.evaluaciones,
              logEvaluaciones: offlineData.logEvaluacion,
              newLogsEvaluaciones: [],
              newLogsUso: state.newLogsUso));

          BlocProvider.of<VehiculoBloc>(event.context!).add(GetCurrent(event.context!));
          BlocProvider.of<FormularioBloc>(event.context!).add(GetLastFormLogs(event.context!));
          return;
        }

        OfflineModeService.setOnline();
        state.newLogsUso.removeWhere((log) => log.fechaFin != null);
        emit(state.copyWith(newLogsUso: state.newLogsUso, newLogsEvaluaciones: []));
        OfflineModeService.syncAvailable = true;
      } catch (_) {
        OfflineModeService.syncAvailable = false;
      }
    });

    on<UpdateVehiculos>((event, emit) async {
      int vehiculoIndex = state.vehiculos!.indexWhere((vehiculo) => vehiculo.id == event.vehiculo.id);
      if (vehiculoIndex != -1) state.vehiculos![vehiculoIndex] = state.vehiculos![vehiculoIndex].copyWith(pendientes: event.vehiculo.pendientes);
      emit(state.copyWith(vehiculos: state.vehiculos));
    });

    on<UpdateLogsForms>((event, emit) async {
      emit(state.copyWith(logEvaluaciones: event.logEvaluaciones));
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
