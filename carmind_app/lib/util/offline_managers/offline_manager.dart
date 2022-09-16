import 'dart:developer';

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

  OfflineManager(this.sharedPreferences, this.service);

  Future<void> activateOffline() async {
    await sharedPreferences.setBool(_keyStorage, true);
    service.invoke(offlineOnMessage);
    log("OFFLINE ACTIVATED");
  }

  Future<void> desactivateOffline() async {
    await sharedPreferences.setBool(_keyStorage, false);
    service.invoke(offlineOffMessage);
    log("OFFLINE DESACTIVATED");
  }

  Future<bool> isOffline() async {
    await sharedPreferences.reload();
    return sharedPreferences.getBool(_keyStorage) ?? false;
  }

  bool isOfflineSync() {
    return sharedPreferences.getBool(_keyStorage) ?? false;
  }
}
