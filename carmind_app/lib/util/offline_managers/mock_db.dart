import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDb {
  int? idVehiculoActual;
  SharedPreferences sharedPreferences;

  MockDb(this.sharedPreferences);

  saveData(OfflineData data) async {
    // Open Isar in the UI isolate
    final isarDb = Isar.getInstance('isar-carmind')!;

    isarDb.writeTxnSync(
      () async {
        //Limpiamos todo, tambien los logs que quedaron como offline
        //Pero se supone que si estamos guardado data, es porque estamos online, y con los logs vacios ya.
        isarDb.clearSync();

        var vehiculosDb = data.vehiculos!.map((e) => VehiculoDb.fromVehiculo(e, isarDb)).toList();
        isarDb.vehiculoDbs.putAllSync(vehiculosDb);
        for (var vehi in vehiculosDb) {
          vehi.pendientesDb.saveSync();
        }

        var evs = data.evaluaciones!.map((e) => EvaluacionDb.fromEvaluacion(e, isarDb)).toList();
        isarDb.evaluacionDbs.putAllSync(evs);
        for (var ev in evs) {
          ev.preguntasDb.saveSync();
          for (var preg in ev.preguntasDb) {
            if (preg.opcionesDb.isNotEmpty) {
              preg.opcionesDb.saveSync();
            }
          }
        }

        isarDb.logEvaluacions.putAllSync(data.logEvaluacion!);
        isarDb.loggedUsers.putSync(data.loggedUser!);
        if (data.idVehiculoActual != null) {
          await sharedPreferences.reload();
          await sharedPreferences.setInt("current-offline", data.idVehiculoActual!);
        }
      },
    );
  }

  Future<LoggedUser?> getLoggedUser() async {
    var db = Isar.getInstance('isar-carmind')!;

    var lstLoggedUser = await db.loggedUsers.where().findAll();
    return lstLoggedUser[0];
  }

  Future<Evaluacion?> getEvaluacionById(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var ev = await db.evaluacionDbs.get(id);
    ev?.preguntasDb.loadSync();
    ev?.preguntasDb.forEach((pregunta) {
      pregunta.opcionesDb.loadSync();
    });

    var out = ev != null ? Evaluacion.fromDb(ev) : null;

    return out;
  }

  Future<void> realizarEvaluacion(int id, EvaluacionTerminadaPojo pojo) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogEvaluacionTerminadaPojoDb()
      ..evaluacionId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    db.writeTxnSync(() {
      db.logEvaluacionTerminadaPojoDbs.putSync(log);

      log.respuestaDb.value = EvaluacionTerminadaPojoDb.fromEvaluacionTerminadaPojo(pojo);
      log.respuestaDb.saveSync();

      log.respuestaDb.value!.respuestasDb.saveSync();
      for (var res in log.respuestaDb.value!.respuestasDb) {
        res.opcionesDb.saveSync();
      }

      // isar.evaluacionTerminadaPojoDbs.putSync(log.respuestaDb.value!);
      // isar.respuestaPojoDbs.putAllSync(log.respuestaDb.value!.respuestasDb.toList());
      // for (var res in log.respuestaDb.value!.respuestasDb) {
      //   isar.respuestaOpcionPojos.putAllSync(res.opcionesDb.toList());
      // }
    });
  }

  Future<List<LogEvaluacion>> getLogEvaluacionesByLoggedUser(String limit) async {
    var db = Isar.getInstance('isar-carmind')!;

    List<LogEvaluacion> logs = [];
    var format = DateFormat(dateTimeFormat);

    logs = await db.logEvaluacions.where().findAll();

    // await db.writeTxn((isar) async {
    //   await db.logEvaluacionTerminadaPojoDbs.clear();
    //   await db.evaluacionTerminadaPojoDbs.clear();
    //   await db.respuestaPojoDbs.clear();
    //   await db.respuestaOpcionPojos.clear();
    // });

    var logsOffline = await db.logEvaluacionTerminadaPojoDbs.where().findAll();
    var evaluaciones = await db.evaluacionDbs.where().findAll();

    logs.addAll(logsOffline.map((e) {
      e.respuestaDb.loadSync();

      var log = LogEvaluacion();
      log.evaluacion_id = e.evaluacionId;
      log.fecha = e.fecha;
      log.nombre_evaluacion = evaluaciones.where((element) => element.id == e.evaluacionId).first.titulo;
      log.vehiculo_id = e.respuesta!.vehiculo_id;
      return log;
    }));
    logs.sort((a, b) => format.parse(b.fecha!).compareTo(format.parse(a.fecha!)));
    if (logs.length > 50) {
      return logs.getRange(0, int.parse(limit)).toList();
    }
    return logs;
  }

  Future<Vehiculo?> getVehiculoById(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var v = await db.vehiculoDbs.get(id);
    return Vehiculo.fromDb(v!);
  }

  Future<void> iniciarUso(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogUso()
      ..enUso = true
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    await db.writeTxn(() async {
      await db.logUsos.put(log);
    });

    sharedPreferences.setInt("current-offline", id);
  }

  Future<void> terminarUso(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogUso()
      ..enUso = false
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    await db.writeTxn(() async {
      await db.logUsos.put(log);
    });

    sharedPreferences.remove("current-offline");
  }

  Future<Vehiculo?> getCurrent() async {
    VehiculoDb? vehiculo;
    var db = Isar.getInstance('isar-carmind')!;

    sharedPreferences.reload();
    int? idVehiculoOffline = sharedPreferences.getInt("current-offline");

    if (idVehiculoOffline != null) {
      vehiculo = await db.vehiculoDbs.get(idVehiculoOffline);
      vehiculo?.pendientesDb.loadSync();
    } else {
      vehiculo = null;
    }

    if (vehiculo != null) {
      vehiculo = await _proccessPrendientes(vehiculo);
      return Vehiculo.fromDb(vehiculo);
    } else {
      return null;
    }
  }

  //-------------------------------------------------------------------------------------------------

  Future<VehiculoDb> _proccessPrendientes(VehiculoDb vehiculo) async {
    var db = Isar.getInstance('isar-carmind')!;
    var lstLogsEvaluacionTerminada = await db.logEvaluacionTerminadaPojoDbs.where().findAll();

    //Obtenemos la lista de logs de este vehiculo
    var listLogs = lstLogsEvaluacionTerminada.where((element) => element.respuesta?.vehiculo_id! == vehiculo.id).toList();

    List<EvaluacionesPendientesDb> listaPendientes = vehiculo.pendientes!;
    List<EvaluacionesPendientesDb> nuevaLista = [];

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
    vehiculo.pendientesDb.addAll(nuevaLista);
    return vehiculo;
  }
}
