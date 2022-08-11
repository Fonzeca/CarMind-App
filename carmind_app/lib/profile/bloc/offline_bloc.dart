import 'dart:convert';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'offline_event.dart';
part 'offline_state.dart';

class OfflineBloc extends HydratedBloc<OfflineEvent, OfflineState> {
  late ApiClient api;

  OfflineBloc() : super(OfflineState(newLogEvaluaciones: const [], newLogsUso: const [])) {
    api = ApiClient(staticDio!);

    on<GetOfflineData>((event, emit) async {
      if (OfflineModeService.isOffline) return;

      var offlineData = await api.obtenerDatosOffline();
      emit(state.copyWith(
          loggedUser: offlineData.loggedUser,
          idVehiculoActual: offlineData.idVehiculoActual,
          vehiculos: offlineData.vehiculos,
          evaluaciones: offlineData.evaluaciones,
          logEvaluaciones: offlineData.logEvaluacion));
    });

    on<IniciarUsoVehiculoOffline>((event, emit) async {
      if (state.vehiculos != null) {
        int vehicleToUseIndex = state.vehiculos!.indexWhere((vehicle) => vehicle.id == event.id);
        if (vehicleToUseIndex == -1) {
          EasyLoading.showError(noVehicle, duration: const Duration(seconds: 3));
          return;
        }
        state.vehiculos![vehicleToUseIndex].en_uso = true;
        state.idVehiculoActual = state.vehiculos![vehicleToUseIndex].id;

        LogUso newLogUso =
            LogUso(usuarioId: state.loggedUser!.id, vehiculoId: state.vehiculos![vehicleToUseIndex].id, fechaInicio: DateTime.now().toString());
        state.newLogsUso.add(newLogUso);

        emit(state.copyWith(newLogsUso: state.newLogsUso, vehiculos: state.vehiculos!));
      }
    });

    on<TerminarUsoVehiculoOffline>((event, emit) async {
      if (state.vehiculos != null) {
        int vehicleToUnuseIndex = state.vehiculos!.indexWhere((vehicle) => vehicle.id == event.id);
        if (vehicleToUnuseIndex == -1) {
          EasyLoading.showError(noVehicle, duration: const Duration(seconds: 3));
          return;
        }
        state.vehiculos![vehicleToUnuseIndex].en_uso = false;
        state.idVehiculoActual = null;

        int logUsoIndex = state.newLogsUso.indexWhere((logUso) => logUso.fechaFin == null);
        state.newLogsUso[logUsoIndex].fechaFin = DateTime.now().toString();

        emit(state.copyWith(newLogsUso: state.newLogsUso, vehiculos: state.vehiculos!));
      }
    });

    on<SetOnline>((event, emit) async {
      /*  emit(state.copyWith(loading: true));

      var boxVehiculos = Hive.box<Vehiculo>("vehiculos");
      var boxEvaluaciones = Hive.box<Evaluacion>("evaluaciones");
      var boxLogsEvaluaciones = Hive.box<LogEvaluacion>("logs");
      var boxLoggedUser = Hive.box<LoggedUser>("loggedUser");
      var boxLogUso = Hive.box<LogUso>("logUso");
      var boxLogEvaluaciones = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");

      SyncView syncView = SyncView();
      syncView.logUso = boxLogUso.values.toList();
      syncView.evaluacionesRealizadas = boxLogEvaluaciones.values.toList();

      var sh = await SharedPreferences.getInstance();

      try {
        await api.sincronizarDatos(syncView).catchError((Object obj) {
          // non-200 error goes here.
          if (obj.runtimeType == DioError) {
            final res = (obj as DioError).response;
            if (res?.statusCode == 403) {
              sh.remove("token");
              emit(state.copyWith(failAuth: true));
              return;
            }
          }
        });
      } catch (e) {
        emit(state.copyWith(loading: false));
        FirebaseCrashlytics.instance.recordError('Detalles: ${e.toString()}', StackTrace.current, reason: 'Error al intentar sincronizar datos');
        return;
      }

      if (!state.failAuth) {
        sh.setBool("offline", false);
        boxVehiculos.clear();
        boxEvaluaciones.clear();
        boxLogsEvaluaciones.clear();
        boxLoggedUser.clear();
        boxLogUso.clear();
        boxLogEvaluaciones.clear();

        emit(state.copyWith(offline: false, loading: false));
      } */
    });
  }

  @override
  OfflineState? fromJson(Map<String, dynamic> json) => OfflineState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(OfflineState state) => state.toMap();
}
