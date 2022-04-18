import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/profile/logged_user.dart';
import 'package:carmind_app/api/pojo/profile/sync_view.dart';
import 'package:carmind_app/api/pojo/vehiculo/log_uso.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'offline_event.dart';
part 'offline_state.dart';

class OfflineBloc extends Bloc<OfflineEvent, OfflineState> {
  late ApiClient api;

  OfflineBloc() : super(const OfflineState(offline: false, loading: false)) {
    api = ApiClient(staticDio!);
    on<SetOffline>((event, emit) async {
      emit(state.copyWith(loading: true));

      var datos = await api.obtenerDatosOffline();

      var boxVehiculos = Hive.box<Vehiculo>("vehiculos");
      var mapVehiculos = {for (var v in datos.vehiculos!) v.id: v};
      boxVehiculos.putAll(mapVehiculos);

      var boxEvaluaciones = Hive.box<Evaluacion>("evaluaciones");
      var mapEvaluaciones = {for (var e in datos.evaluaciones!) e.id: e};
      boxEvaluaciones.putAll(mapEvaluaciones);

      //No lo mapeamos con el id como key, porque se desordenan.
      var boxLogsEvaluaciones = Hive.box<LogEvaluacion>("logs");
      boxLogsEvaluaciones.addAll(datos.logEvaluacion!);

      var boxLoggedUser = Hive.box<LoggedUser>("loggedUser");
      boxLoggedUser.put(0, datos.loggedUser!);

      var sh = await SharedPreferences.getInstance();
      sh.setBool("offline", true);

      emit(state.copyWith(offline: true, loading: false));
    });

    on<SetOnline>((event, emit) async {
      emit(state.copyWith(loading: true));

      var boxVehiculos = Hive.box<Vehiculo>("vehiculos");
      var boxEvaluaciones = Hive.box<Evaluacion>("evaluaciones");
      var boxLogsEvaluaciones = Hive.box<LogEvaluacion>("logs");
      var boxLoggedUser = Hive.box<LoggedUser>("loggedUser");
      var boxLogUso = Hive.box<LogUso>("logUso");
      var boxLogEvaluaciones = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");

      SyncView syncView = SyncView();
      syncView.logUso = boxLogUso.values.toList();
      syncView.evaluacionesRealizadas = boxLogEvaluaciones.values.toList();

      try {
        await api.sincronizarDatos(syncView);
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(loading: false));
        return;
      }

      var sh = await SharedPreferences.getInstance();
      sh.setBool("offline", false);

      boxVehiculos.clear();
      boxEvaluaciones.clear();
      boxLogsEvaluaciones.clear();
      boxLoggedUser.clear();
      boxLogUso.clear();
      boxLogEvaluaciones.clear();

      emit(state.copyWith(offline: false, loading: false));
    });
  }
}
