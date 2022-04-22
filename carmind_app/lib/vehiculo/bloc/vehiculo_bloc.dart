import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
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

        if (vehiculo != null) {
          vehiculo = proccessPrendientes(vehiculo!);
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

  Vehiculo proccessPrendientes(Vehiculo vehiculo) {
    var box = Hive.box<LogEvaluacionTerminadaPojo>("evaluacionesTerminadas");

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
        var format = DateFormat("dd/MM/yyyy");
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
          var format = DateFormat("dd/MM/yyyy HH:mm:ss");
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
  }
}
