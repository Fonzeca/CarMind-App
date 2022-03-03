import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vehiculo_event.dart';
part 'vehiculo_state.dart';

class VehiculoBloc extends Bloc<VehiculoEvent, VehiculoState> {
  late ApiClient api;

  Vehiculo? vehiculo;
  VehiculoBloc() : super(const VehiculoState(loading: true)) {
    api = ApiClient(staticDio!);

    on<GetCurrent>((event, emit) async {
      emit(state.copyWith(loading: true, vehiculo: null));

      vehiculo = await api.getCurrent().catchError((err) {
        switch (err.runtimeType) {
          case DioError:
            final res = (err as DioError).response;

            break;
          default:
        }
      });

      emit(state.copyWith(vehiculo: vehiculo, loading: false));
    });

    on<DejarUsar>((event, emit) async {
      emit(state.copyWith(loading: true));

      await api.terminarUso(vehiculo!.id!);

      add(GetCurrent());
    });

    on<TapEvaluacion>((event, emit) async {
      Evaluacion ev = await api.getEvaluacionById(event.id);
      BlocProvider.of<HomeBloc>(event.context)
        ..add(HomeNavigationEvent(4, data: ev))
        ..add(HideFab());

      vehiculo = null;
      emit(state.copyWith(vehiculo: vehiculo));
    });
  }
}
