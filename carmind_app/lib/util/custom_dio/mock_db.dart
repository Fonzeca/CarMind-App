import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDb {
  int? idVehiculoActual;
  LoggedUser? loggedUser;
  List<Vehiculo>? vehiculos;
  List<Evaluacion>? evaluaciones;
  List<LogEvaluacion>? logEvaluaciones;
  SharedPreferences sharedPreferences;

  MockDb(this.sharedPreferences);

  saveData(OfflineData data) async {
    await verifyBoxes();

    var boxVehiculos = await Hive.openBox<Vehiculo>("vehiculos");
    var mapVehiculos = {for (var v in data.vehiculos!) v.id: v};
    await boxVehiculos.putAll(mapVehiculos);

    // Open Isar in the UI isolate
    final isarDb = Isar.getInstance('myInstance')!;

    await isarDb.writeTxn(
      (isar) async {
        isar.vehiculos.putAll(data.vehiculos!);
      },
    );

    var boxEvaluaciones = Hive.box<Evaluacion>("evaluaciones");
    var mapEvaluaciones = {for (var e in data.evaluaciones!) e.id: e};
    await boxEvaluaciones.putAll(mapEvaluaciones);

    var boxLogsEvaluaciones = Hive.box<LogEvaluacion>("logs");
    var mapLogsEvaluaciones = {for (var i in data.logEvaluacion!) i.log_id: i};
    await boxLogsEvaluaciones.putAll(mapLogsEvaluaciones);

    var boxLoggedUser = Hive.box<LoggedUser>("loggedUser");
    await boxLoggedUser.put(0, data.loggedUser!);

    if (data.idVehiculoActual != null) {
      await sharedPreferences.reload();
      await sharedPreferences.setInt("current-offline", data.idVehiculoActual!);
    }

    await boxVehiculos.close();
  }

  Future<void> verifyBoxes() async {
    if (!Hive.isBoxOpen('logs')) {
      await openBoxes();
    }
  }

  Future<void> closeBoxes() async {
    EasyLoading.show();
    await Hive.close();
    EasyLoading.dismiss();
  }

  Future<void> openBoxes() async {
    await Hive.openBox<Vehiculo>('vehiculos');
    await Hive.openBox<LogEvaluacion>('logs');
    await Hive.openBox<LoggedUser>('loggedUser');
    await Hive.openBox<Evaluacion>('evaluaciones');
    await Hive.openBox<LogUso>('logUso');
    await Hive.openBox<LogEvaluacionTerminadaPojo>('evaluacionesTerminadas');
  }

  Future<LoggedUser?> getLoggedUser() async {
    await verifyBoxes();
    loggedUser ??= Hive.box<LoggedUser>("loggedUser").get(0);
    return loggedUser;
  }

  Future<Evaluacion?> getEvaluacionById(int id) async {
    await verifyBoxes();
    return Hive.box<Evaluacion>("evaluaciones").get(id);
  }

  Future<void> realizarEvaluacion(int id, EvaluacionTerminadaPojo pojo) async {
    await verifyBoxes();
    var box = Hive.box<LogEvaluacionTerminadaPojo>('evaluacionesTerminadas');

    var log = LogEvaluacionTerminadaPojo()
      ..evaluacionId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now())
      ..respuesta = pojo;

    box.add(log);
  }

  Future<List<LogEvaluacion>> getLogEvaluacionesByLoggedUser(String limit) async {
    await verifyBoxes();
    List<LogEvaluacion> logs = [];
    var format = DateFormat(dateTimeFormat);

    var box = Hive.box<LogEvaluacion>("logs").values;
    logs = box.toList();

    var boxLogsOffline = Hive.box<LogEvaluacionTerminadaPojo>('evaluacionesTerminadas');
    var boxEvaluaciones = Hive.box<Evaluacion>('evaluaciones');

    logs.addAll(boxLogsOffline.values.map((e) {
      var log = LogEvaluacion();
      log.evaluacion_id = e.evaluacionId;
      log.fecha = e.fecha;
      log.nombre_evaluacion = boxEvaluaciones.get(e.evaluacionId)?.titulo;
      log.vehiculo_id = e.respuesta?.vehiculo_id;
      return log;
    }));
    logs.sort((a, b) => format.parse(b.fecha!).compareTo(format.parse(a.fecha!)));
    return logs.getRange(0, int.parse(limit)).toList();
  }

  Future<Vehiculo?> getVehiculoById(int id) async {
    await verifyBoxes();
    return Hive.box<Vehiculo>("vehiculos").get(id);
  }

  Future<void> iniciarUso(int id) async {
    await verifyBoxes();
    var box = Hive.box<LogUso>("logUso");
    var log = LogUso()
      ..enUso = true
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());
    box.add(log);

    sharedPreferences.setInt("current-offline", id);
  }

  Future<void> terminarUso(int id) async {
    await verifyBoxes();
    var box = Hive.box<LogUso>("logUso");
    var log = LogUso()
      ..enUso = false
      ..vehiculoId = id
      ..fecha = DateFormat(dateTimeFormat).format(DateTime.now());
    box.add(log);

    sharedPreferences.remove("current-offline");
  }

  Future<Vehiculo?> getCurrent() async {
    await verifyBoxes();
    Vehiculo? vehiculo;

    int? idVehiculoOffline = sharedPreferences.getInt("current-offline");

    if (idVehiculoOffline != null) {
      vehiculo = Hive.box<Vehiculo>("vehiculos").get(idVehiculoOffline);
    } else {
      vehiculo = null;
    }

    if (vehiculo != null) {
      vehiculo = _proccessPrendientes(vehiculo);
    }

    return vehiculo;
  }

  //-------------------------------------------------------------------------------------------------

  Vehiculo _proccessPrendientes(Vehiculo vehiculo) {
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
