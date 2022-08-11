import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:carmind_app/services/services.dart';
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
      emit(state.copyWith(loading: true));
      lastTimeFetched ??= DateTime.now();

      if (vehiculo != null && (DateTime.now().difference(lastTimeFetched!).inMinutes < 3 && !event.forceWaiting)) {
        emit(state.copyWith(loading: false));
        return;
      }

      //Validamos si esta en modo offline
      if (OfflineModeService.isOffline) {
        OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(event.context);
        int? idVehiculoActual = offlineBloc.state.idVehiculoActual;
        if (idVehiculoActual != null && offlineBloc.state.vehiculos != null) {
          vehiculo = offlineBloc.state.vehiculos!.firstWhere((vehicle) => vehicle.id == idVehiculoActual);
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
        await api.terminarUso(vehiculo!.id!);
        BlocProvider.of<OfflineBloc>(event.context).add(TerminarUsoVehiculoOffline(vehiculo!.id!));
      }

      lastTimeFetched ??= DateTime.now();
      vehiculo = null;
      add(GetCurrent(event.context));
    });

    on<TapEvaluacion>((event, emit) async {
      var ev;

      bool deletedEvaluation = false;

      if (OfflineModeService.isOffline) {
        /*   var box = Hive.box<Evaluacion>("evaluaciones");
        ev = box.get(event.id)!; */
      } else {
        try {
          ev = await api.getEvaluacionById(event.id);
        } on DioError catch (e) {
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
        ..add(HomeNavigationEvent(4, evaluacion: ev, vehiculo: vehiculo))
        ..add(HideFab());

      emit(state.copyWith(vehiculo: vehiculo));
    });
  }

/*   Vehiculo proccessPrendientes(Vehiculo vehiculo) {
    
    //Obtenemos la lista de logs de este vehiculo
    var listLogs = box.values.where((element) => element.respuesta?.vehiculo_id! == vehiculo.id).toList();

    List<EvaluacionesPendientes> listaPendientes = vehiculo.pendientes!;
    List<EvaluacionesPendientes> nuevaLista = [];

    //Revisamos las evaluaciones asignadas al vehiculo
    for (var eva in listaPendientes) {
      //Obtenemos los logs offlines para este pendiente/evaluacion asignada.
      var listLogsEvaluacion = listLogs.where((element) => element.evaluacionId == eva.id).toList();

      //Si esta vacia, marcamos como pendiente directamente
      if (listLogsEvaluacion.isEmpty) {
        eva
          ..pendiente = true
          ..vencimiento = 0;
      } else {
        //Si no esta vacia, buscamos los logs que cumplan para poner el pendiente en false
        var format = DateFormat(dateFormat);
        var logsInTime = listLogsEvaluacion.where((element) => format
            .parse(element.fecha!) //Transformamos la fecha de log en un objeto DateTime
            .add(Duration(days: eva.intervaloDias!)) //Le agregamos el intervalo de dias, para despues comprarlo
            .isAfter(DateTime.now())); //Se compara el dia de hoy, sin el tiempo (HH:mm:ss)

        //Si no hay ningun log efectivo, se deja pendiente
        if (logsInTime.isEmpty) {
          eva
            ..pendiente = true
            ..vencimiento = 0;
        } else {
          //Cuando si hay un efectivo, se ordenan entre todos los logs efectivos, para que tengamos el ultimo log.
          var format = DateFormat(dateTimeFormat);
          var listSorted = logsInTime.toList();
          listSorted.sort((a, b) => format.parse(a.fecha!).compareTo(format.parse(b.fecha!)));

          //obtenemos el log mas reciente
          var logEfectivo = listSorted.last;

          //Creamos bien el pendiente
          eva
            ..pendiente = false
            ..vencimiento = format.parse(logEfectivo.fecha!).add(Duration(days: eva.intervaloDias!)).difference(DateTime.now()).inDays + 1;
        }
      }

      //Agregamos el pendiente modificado a la lista nueva
      nuevaLista.add(eva);
    }

    //Le asignamos la lista neuva al vehiculo
    vehiculo.pendientes = nuevaLista;
    return vehiculo;
  } */
}
