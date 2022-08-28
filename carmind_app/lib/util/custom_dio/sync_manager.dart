import 'dart:io';

import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/profile/offline_data.dart';
import 'package:carmind_app/lifecycle_manager.dart';
import 'package:carmind_app/util/custom_dio/offline_manager.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncManager {
  final OfflineManager offlineManager;
  final SharedPreferences sharedPreferences;
  final ServiceInstance service;
  late ApiClient api;

  AppLifecycleState appState = AppLifecycleState.resumed;

  static String SYNC_MEESSAGE = "sync-data";

  SyncManager({required this.offlineManager, required this.sharedPreferences, required this.service}) {
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

    service.on(LifeCycleManager.KEY_INVOKE_SERVICE).listen((event) {
      var appStateName = event?["state"] as String;
      appState = AppLifecycleState.values.byName(appStateName);
      print("APP IN $appState");
    });

    api = ApiClient(myDio);
  }

  //Metodo llamado por el background service
  Future<void> doSync() async {
    print("DOSYNC START");
    if (await offlineManager.isOffline()) {
      try {
        var response = await api.valdiateToken();
        if (response.response.statusCode != null) {
          //DO SYNC TO CLOUD
          await syncDataToCloud();
        }
      } catch (e) {
        //Si da error al obtener datos Offline, lo pasamos al modo offline
        if (e is DioError && e.error is SocketException) {
        } else {
          await syncDataToCloud();
        }
      }
    } else if (await isLogged()) {
      try {
        //Alimentamos al Mock con los ultimos datos.
        OfflineData data = await api.obtenerDatosOffline();

        //Mandamos el mensaje al thread del Mock
        service.invoke(SYNC_MEESSAGE, data.toJson());

        print("SEND MESSAGE TO SAVE DATA");
      } catch (e) {
        //Si da error al obtener datos Offline, lo pasamos al modo offline
        if (e is DioError && e.error is SocketException) {
          offlineManager.activateOffline();
        }
      }
    }
  }

  Future<void> syncDataToCloud() async {
    service.invoke("try-sync");
    if (appState == AppLifecycleState.detached) {
    } else {}

    await offlineManager.desactivateOffline();
  }

  Future<bool> isLogged() async {
    await sharedPreferences.reload();
    return sharedPreferences.containsKey("token");
  }
}
