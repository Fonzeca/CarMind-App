import 'dart:io';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/util/offline_managers/mock_db.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncManager {
  final OfflineManager offlineManager;
  final SharedPreferences sharedPreferences;
  final MockDb mockDb;
  final ServiceInstance service;
  late ApiClient api;

  AppLifecycleState appState = AppLifecycleState.resumed;

  // ignore: non_constant_identifier_names
  static String SYNC_MEESSAGE_TOKEN_RENEWED = "login-to-sync";

  SyncManager(
      {required this.offlineManager, required this.sharedPreferences, required this.service, required this.mockDb, required String directoryIsar}) {
    //Construimos nuestro Dio personalizado
    var myDio = Dio();

    (myDio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    myDio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      //Fetcheamos los cambios
      await sharedPreferences.reload();
      String? token = sharedPreferences.getString("token");
      options.headers.addAll({'Authorization': "Bearer $token"});
      handler.next(options);
    }));

    api = ApiClient(myDio);

    print(directoryIsar);

    final isar = Isar.openSync(
        name: 'isar-carmind',
        schemas: [
          LogUsoSchema,
          LoggedUserSchema,
          OpcionPojoSchema,
          VehiculoDbSchema,
          EvaluacionDbSchema,
          LogEvaluacionSchema,
          PreguntaPojoDbSchema,
          RespuestaPojoDbSchema,
          RespuestaOpcionPojoSchema,
          EvaluacionesPendientesSchema,
          EvaluacionTerminadaPojoDbSchema,
          LogEvaluacionTerminadaPojoDbSchema
        ],
        directory: directoryIsar);

    service.on(SYNC_MEESSAGE_TOKEN_RENEWED).listen((event) {
      syncDataToCloud();
    });
  }

  //Metodo llamado por el background service
  Future<void> doSync() async {
    await printServiceNotification("");

    print("DoSync");
    if (await offlineManager.isOffline()) {
      // if (Math.Random().nextInt(100) > 80) {
      //   sharedPreferences.reload();
      //   sharedPreferences.setString("token", "asdasdasd");
      //   log("Deslogeamos");
      // }

      await printServiceNotification("Tratando de conectar...");
      print("Is offline");
      try {
        //Intentamos conectar al serivodr
        var response = await api.valdiateToken();

        if (response.response.statusCode == 200) {
          await printServiceNotification("Sincronizando datos...");
          //Si devuelve ok
          //tratar de sincronizar
          await syncDataToCloud();
        }
      } catch (e) {
        //Si da error, hay que ver si es por token vencido o por falta de internet
        if (e is DioError) {
          if (e.error is SocketException) {
          } else if (e.response?.statusCode == 401) {
            sharedPreferences.remove("token");
            //Desloguear
          }
        }
      }
    } else if (await isLogged()) {
      print("Is online and logged");
      try {
        //Obtenemos los ultimos datos de la nube
        OfflineData data = await api.obtenerDatosOffline();

        //Mandamos el mensaje al thread del Mock
        mockDb.saveData(data);

        print("Data saved");
      } catch (e) {
        //Si da error al obtener datos Offline, lo pasamos al modo offline
        if (e is DioError && e.error is SocketException) {
          await printServiceNotification("MODO OFFLINE ACTIVADO");
          offlineManager.activateOffline();
        }
      }
    } else {
      print("Online and not logged");
    }
    await printServiceNotification("");
  }

  Future<void> syncDataToCloud() async {
    var db = Isar.getInstance('isar-carmind')!;

    SyncView syncView = SyncView();
    syncView.logUso = await db.logUsos.where().findAll();
    var evaluacionesTermiandas = await db.logEvaluacionTerminadaPojoDbs.where().findAll();
    for (var evTerminada in evaluacionesTermiandas) {
      evTerminada.respuestaDb.loadSync();
      evTerminada.respuestaDb.value!.respuestasDb.loadSync();
      for (var res in evTerminada.respuestaDb.value!.respuestasDb) {
        res.opcionesDb.loadSync();
      }
    }
    syncView.evaluacionesRealizadas = evaluacionesTermiandas;

    //Si no hay nada que sincronizar, solo lo ponemos online
    if (syncView.logUso!.isEmpty && syncView.evaluacionesRealizadas!.isEmpty) {
      await offlineManager.desactivateOffline();
      return;
    }

    //Mandamos los datos al servidor
    await api.sincronizarDatos(syncView).catchError((e) {
      return;
    });

    //Al estar todo ok, borramos la base de datos.
    await db.writeTxn((isar) async {
      await db.logUsos.clear();
      await db.logEvaluacionTerminadaPojoDbs.clear();
      await db.evaluacionTerminadaPojoDbs.clear();
      await db.respuestaPojoDbs.clear();
      await db.respuestaOpcionPojos.clear();
    });

    await offlineManager.desactivateOffline();
  }

  Future<void> printServiceNotification(String text) async {
    if (service is AndroidServiceInstance) {
      var ser = (service as AndroidServiceInstance);
      if (text.isEmpty) {
        await ser.setForegroundNotificationInfo(title: "CarMind", content: "Gestor de conexion");
        // await ser.setAsBackgroundService();
      } else {
        // await ser.setAsForegroundService();
        await ser.setForegroundNotificationInfo(title: "CarMind", content: text);
      }
    }
  }

  Future<bool> isLogged() async {
    await sharedPreferences.reload();
    return sharedPreferences.containsKey("token");
  }
}
