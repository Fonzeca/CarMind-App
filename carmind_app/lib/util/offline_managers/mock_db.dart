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

    await isarDb.writeTxn(
      (isar) async {
        //Limpiamos todo, tambien los logs que quedaron como offline
        //Pero se supone que si estamos guardado data, es porque estamos online, y con los logs vacios ya.
        await isar.clear();

        var vehis = data.vehiculos!.map((e) => VehiculoDb.fromVehiculo(e)).toList();
        await isar.vehiculoDbs.putAll(vehis);
        for (var v in vehis) {
          await v.pendientesDb.save();
          await isar.evaluacionesPendientess.putAll(v.pendientesDb.toList());
        }

        var evs = data.evaluaciones!.map((e) => EvaluacionDb.fromEvaluacion(e)).toList();
        await isar.evaluacionDbs.putAll(evs);
        for (var ev in evs) {
          await isar.preguntaPojoDbs.putAll(ev.preguntasDb.toList());
          await ev.preguntasDb.save();
          for (var preg in ev.preguntasDb) {
            if (preg.opcionesDb.isNotEmpty) {
              await isar.opcionPojos.putAll(preg.opcionesDb.toList());
              await preg.opcionesDb.save();
            }
          }
        }

        await isar.logEvaluacions.putAll(data.logEvaluacion!);
        await isar.loggedUsers.put(data.loggedUser!, replaceOnConflict: true);
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

    return ev;
  }

  Future<void> realizarEvaluacion(int id, EvaluacionTerminadaPojo pojo) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogEvaluacionTerminadaPojoDb()
      ..evaluacionId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    db.writeTxnSync((isar) {
      isar.logEvaluacionTerminadaPojoDbs.putSync(log);

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
    return db.vehiculoDbs.get(id);
  }

  Future<void> iniciarUso(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogUso()
      ..enUso = true
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    await db.writeTxn((isar) async {
      await isar.logUsos.put(log);
    });

    sharedPreferences.setInt("current-offline", id);
  }

  Future<void> terminarUso(int id) async {
    var db = Isar.getInstance('isar-carmind')!;

    var log = LogUso()
      ..enUso = false
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());

    await db.writeTxn((isar) async {
      await isar.logUsos.put(log);
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
    }

    return vehiculo;
  }

  //-------------------------------------------------------------------------------------------------

  Future<VehiculoDb> _proccessPrendientes(VehiculoDb vehiculo) async {
    var db = Isar.getInstance('isar-carmind')!;
    var lstLogsEvaluacionTerminada = await db.logEvaluacionTerminadaPojoDbs.where().findAll();

    //Obtenemos la lista de logs de este vehiculo
    var listLogs = lstLogsEvaluacionTerminada.where((element) => element.respuesta?.vehiculo_id! == vehiculo.id).toList();

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
  }
}
