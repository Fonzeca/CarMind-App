import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/log_uso.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'vehiculo_event.dart';
part 'vehiculo_state.dart';

class VehiculoBloc extends Bloc<VehiculoEvent, VehiculoState> {
  late ApiClient api;

  Vehiculo? vehiculo;
  VehiculoBloc() : super(const VehiculoState(loading: true)) {
    api = ApiClient(staticDio!);

    on<GetCurrent>((event, emit) async {
      emit(state.copyWith(loading: true, vehiculo: null));

      //Validamos si esta en modo offline
      var sh = await SharedPreferences.getInstance();
      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogUso>("logUso");
        var log = box.values.isEmpty ? null : box.values.last;

        //Buscamos el vehiculos
        if (log != null && log.enUso!) {
          vehiculo = Hive.box<Vehiculo>("vehiculos").get(log.vehiculoId);
        } else {
          int? idVehiculoOffline = sh.getInt("current-offline");

          if (idVehiculoOffline != null) {
            vehiculo = Hive.box<Vehiculo>("vehiculos").get(idVehiculoOffline);
          } else {
            //Si el log es de "desuso" lo dejamos en null
            vehiculo = null;
          }
        }
      } else {
        //Si no esta offline, le preguntamos al server
        vehiculo = await api.getCurrent().catchError((err) {
          switch (err.runtimeType) {
            case DioError:
              final res = (err as DioError).response;
              break;
            default:
          }
        });
      }

      emit(state.copyWith(vehiculo: vehiculo, loading: false));
    });

    on<DejarUsar>((event, emit) async {
      emit(state.copyWith(loading: true));

      var sh = await SharedPreferences.getInstance();
      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<LogUso>("logUso");
        var log = LogUso()
          ..enUso = false
          ..vehiculoId = vehiculo!.id!
          ..fecha = DateFormat("dd/MM/yyyy HH:mm:ss").format(DateTime.now());
        box.add(log);
      } else {
        await api.terminarUso(vehiculo!.id!);
      }

      add(GetCurrent());
    });

    on<TapEvaluacion>((event, emit) async {
      Evaluacion ev;

      var sh = await SharedPreferences.getInstance();
      if (sh.getBool("offline") != null && sh.getBool("offline")!) {
        var box = Hive.box<Evaluacion>("evaluaciones");
        ev = box.get(event.id)!;
      } else {
        ev = await api.getEvaluacionById(event.id);
      }

      BlocProvider.of<HomeBloc>(event.context)
        ..add(HomeNavigationEvent(4, data: [ev, vehiculo]))
        ..add(HideFab());

      vehiculo = null;
      emit(state.copyWith(vehiculo: vehiculo));
    });
  }
}
