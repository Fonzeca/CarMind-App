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

      OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(event.context);

      if (OfflineModeService.isOffline(context: event.context)) {
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
          //Si está usando un vehiculo y no hay logs de uso guardados localmente, es porque la persona borró la cache o desintaló la
          //app y la volvió a instalar, entonces creamos el log localmente por si despues se desconecta de internet
          //y quiere dejar de usar el vehiculo
          if (vehiculo != null && offlineBloc.state.newLogsUso.isEmpty) {
            offlineBloc.add(IniciarUsoVehiculoOffline(event.context, vehiculo!.id!));
          }
        } catch (e) {
          if (OfflineModeService.isOffline(context: event.context)) {
            add(GetCurrent(event.context, forceWaiting: event.forceWaiting));
            return;
          }
        }
      }

      if (needToUpdate) {
        needToUpdate = false;
        offlineBloc.add(UpdateVehiculos(vehiculo!));
      }

      lastTimeFetched = DateTime.now();
      final bool showDejarDeUsarVehiculo = vehiculo != null;
      BlocProvider.of<HomeBloc>(event.context).add(ShowDejarDeUsarVehiculoEvent(showDejarDeUsarVehiculo));
      emit(state.copyWith(vehiculo: vehiculo, loading: false, updateVehicle: true));
    });

    on<DejarUsar>((event, emit) async {
      emit(state.copyWith(loading: true));
      OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(event.context);

      if (OfflineModeService.isOffline(context: event.context)) {
        offlineBloc.add(TerminarUsoVehiculoOffline(event.context, vehiculo!.id!));
      } else {
        try {
          await api.terminarUso(vehiculo!.id!);
          offlineBloc.add(TerminarUsoVehiculoOffline(event.context, vehiculo!.id!, deleteLog: true));
        } catch (e) {
          if (OfflineModeService.isOffline(context: event.context)) {
            add(DejarUsar(event.context));
            return;
          }
        }
      }

      lastTimeFetched ??= DateTime.now();
      vehiculo = null;
    });

    on<TapEvaluacion>((event, emit) async {
      var evaluation;

      bool deletedEvaluation = false;

      if (OfflineModeService.isOffline(context: event.context)) {
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
          if (OfflineModeService.isOffline(context: event.context)) {
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
