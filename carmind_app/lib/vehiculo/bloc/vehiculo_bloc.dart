import 'package:carmind_app/constants.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/services/services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../api/api.dart';
import '../../home/home.dart';
import '../../main.dart';

part 'vehiculo_event.dart';
part 'vehiculo_state.dart';

class VehiculoBloc extends Bloc<VehiculoEvent, VehiculoState> {
  late ApiClient api;
  DateTime? lastTimeFetched;

  bool needToUpdate = false;

  Vehiculo? vehiculo;
  VehiculoBloc() : super(const VehiculoState(loading: true)) {
    api = ApiClient(staticDio!);

    on<GetCurrent>((event, emit) async {
      emit(state.copyWith(loading: true));
      lastTimeFetched ??= DateTime.now();

      if (vehiculo != null && (DateTime.now().difference(lastTimeFetched!).inMinutes < 3 && !event.forceWaiting)) {
        emit(state.copyWith(loading: false));
        return;
      }

      if (OfflineModeService.isOffline) {
        OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(event.context);
        int? idVehiculoActual = offlineBloc.state.idVehiculoActual;
        if (idVehiculoActual != null && idVehiculoActual != 0 && offlineBloc.state.vehiculos != null) {
          vehiculo = offlineBloc.state.vehiculos!.firstWhere((vehicle) => vehicle.id == idVehiculoActual);
        }
      } else {
        try {
          vehiculo = await api.getCurrent().catchError((err) {
            switch (err.runtimeType) {
              case DioError:
                final res = (err as DioError).response;
                break;
              default:
            }
          });
        } catch (e) {
          if (OfflineModeService.isOffline) {
            add(GetCurrent(event.context, forceWaiting: event.forceWaiting));
            return;
          }
        }
      }

      lastTimeFetched = DateTime.now();
      final bool showDejarDeUsarVehiculo = vehiculo != null;
      BlocProvider.of<HomeBloc>(event.context).add(ShowDejarDeUsarVehiculoEvent(showDejarDeUsarVehiculo));
      emit(state.copyWith(vehiculo: vehiculo, loading: false, updateVehicle: true));
    });

    on<DejarUsar>((event, emit) async {
      emit(state.copyWith(loading: true));

      if (OfflineModeService.isOffline) {
        BlocProvider.of<OfflineBloc>(event.context).add(TerminarUsoVehiculoOffline(vehiculo!.id!));
      } else {
        try {
          await api.terminarUso(vehiculo!.id!);
          BlocProvider.of<OfflineBloc>(event.context).add(TerminarUsoVehiculoOffline(vehiculo!.id!, deleteLog: true));
        } catch (e) {
          if (OfflineModeService.isOffline) {
            add(DejarUsar(event.context));
            return;
          }
        }
      }

      lastTimeFetched ??= DateTime.now();
      vehiculo = null;
      add(GetCurrent(event.context));
    });

    on<TapEvaluacion>((event, emit) async {
      var evaluation;

      bool deletedEvaluation = false;

      if (OfflineModeService.isOffline) {
        OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(event.context);
        evaluation = offlineBloc.state.evaluaciones!.firstWhere((evaluation) => evaluation.id == event.id, orElse: () => Evaluacion());
        if (evaluation.id == null) {
          EasyLoading.showError(noEvaluation, duration: const Duration(seconds: 3));
          return;
        }
      } else {
        try {
          evaluation = await api.getEvaluacionById(event.id);
        } on DioError catch (e) {
          if (OfflineModeService.isOffline) {
            add(TapEvaluacion(event.id, event.context));
            return;
          }

          if (e.response!.statusCode == 404) {
            deletedEvaluation = true;
            vehiculo = null;
          }
        }
      }

      if (deletedEvaluation) {
        add(GetCurrent(event.context));
        return;
      }

      BlocProvider.of<HomeBloc>(event.context)
        ..add(HomeNavigationEvent(4, evaluacion: evaluation, vehiculo: vehiculo))
        ..add(HideFab());

      emit(state.copyWith(vehiculo: vehiculo));
    });
  }
}
