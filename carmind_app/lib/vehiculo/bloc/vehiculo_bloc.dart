import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      emit(state.copyWith(loading: true, vehiculo: null));

      lastTimeFetched ??= DateTime.now();
      if ((vehiculo == null) || (DateTime.now().difference(lastTimeFetched!).inMinutes > 5 || event.forceWaiting)) {
        vehiculo = await api.getCurrent().catchError((err) {
          switch (err.runtimeType) {
            case DioError:
              final res = (err as DioError).response;
              break;
            default:
          }
        });
        lastTimeFetched = DateTime.now();
      }
      final bool showDejarDeUsarVehiculo = vehiculo != null;
      BlocProvider.of<HomeBloc>(event.context).add(ShowDejarDeUsarVehiculoEvent(showDejarDeUsarVehiculo));
      emit(state.copyWith(vehiculo: vehiculo, loading: false));
    });

    on<DejarUsar>((event, emit) async {
      emit(state.copyWith(loading: true));

      await api.terminarUso(vehiculo!.id!);

      lastTimeFetched ??= DateTime.now();
      vehiculo = null;
      add(GetCurrent(event.context));
    });

    on<TapEvaluacion>((event, emit) async {
      var ev;

      bool deletedEvaluation = false;

      try {
        ev = await api.getEvaluacionById(event.id);
      } on DioError catch (e) {
        if (e.response!.statusCode == 404) {
          deletedEvaluation = true;
          vehiculo = null;
        }
      }

      if (deletedEvaluation) {
        add(GetCurrent(event.context));
        return;
      }

      BlocProvider.of<HomeBloc>(event.context)
        ..add(HomeNavigationEvent(4, evaluacion: ev, vehiculo: vehiculo))
        ..add(HideFab());

      emit(state.copyWith(vehiculo: vehiculo));
    });
  }
}
