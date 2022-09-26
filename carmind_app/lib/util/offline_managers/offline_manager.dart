import 'dart:async';

import 'package:carmind_app/util/offline_managers/background_isolate/sync_manager.dart';
import 'package:flutter_background_service_platform_interface/flutter_background_service_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Clase que se dedica solo a cambiar el estado de la app de
/// offline a online, guardando el estado en [sharedPreferences].
/// El key del storage es [_keyStorage]
class OfflineManager {
  final SharedPreferences sharedPreferences;
  final Observable service;
  final String _keyStorage = "offline-mode";

  static const offlineOnMessage = "offline_activated";
  static const offlineOffMessage = "offline_desactivated";

  final controller = StreamController.broadcast(sync: true);

  OfflineManager(this.sharedPreferences, this.service);

  Future<void> activateOffline() async {
    await sharedPreferences.setBool(_keyStorage, true);
    service.invoke(offlineOnMessage);
    controller.add(offlineOnMessage);
    print("OFFLINE ACTIVATED");
  }

  Future<void> desactivateOffline() async {
    await sharedPreferences.setBool(_keyStorage, false);
    service.invoke(offlineOffMessage);
    controller.add(offlineOffMessage);
    service.invoke(SyncManager.MANUALLY_SYNC);
    print("OFFLINE DESACTIVATED");
  }

  Future<bool> isOffline() async {
    await sharedPreferences.reload();
    return sharedPreferences.getBool(_keyStorage) ?? false;
  }

  bool isOfflineSync() {
    return sharedPreferences.getBool(_keyStorage) ?? false;
  }
}
