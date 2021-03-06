import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:carmind_app/main.dart';
import 'package:carmind_app/api/api.dart';

part 'offline_event.dart';
part 'offline_state.dart';

class OfflineBloc extends Bloc<OfflineEvent, OfflineState> {
  late ApiClient api;

  OfflineBloc() : super(const OfflineState(offline: false, loading: false, failAuth: false)) {
    api = ApiClient(staticDio!);
    on<SyncEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      var sh = await SharedPreferences.getInstance();
      var offline = sh.getBool("offline");

      emit(state.copyWith(offline: offline, loading: false));
    });

    on<SetOffline>((event, emit) async {
      emit(state.copyWith(loading: true));

      var datos = await api.obtenerDatosOffline();
      var sh = await SharedPreferences.getInstance();

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

      if (datos.idVehiculoActual != null) {
        sh.setInt("current-offline", datos.idVehiculoActual!);
      }

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
        FirebaseCrashlytics.instance.recordError(
          'Detalles: ${e.toString()}',
          StackTrace.current,
          reason: 'Error al intentar sincronizar datos'
        );
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
      }
    });
  }
}
