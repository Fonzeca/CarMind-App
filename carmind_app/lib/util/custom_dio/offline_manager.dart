import 'package:carmind_app/util/custom_dio/interfaces/offline_getter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Clase que se dedica solo a cambiar el estado de la app de
/// offline a online, guardando el estado en [sharedPreferences].
/// El key del storage es [_keyStorage]
class OfflineManager extends OfflineGetter {
  final SharedPreferences sharedPreferences;
  final String _keyStorage = "offline-mode";

  OfflineManager(this.sharedPreferences);

  //Public constructor
  static Future<OfflineManager> getInstance() async {
    var sh = await SharedPreferences.getInstance();
    return OfflineManager(sh);
  }

  Future<void> activateOffline() async {
    await sharedPreferences.setBool(_keyStorage, true);
    print("OFFLINE ACTIVATED");
  }

  Future<void> desactivateOffline() async {
    await sharedPreferences.setBool(_keyStorage, false);
    print("OFFLINE DESACTIVATED");
  }

  @override
  Future<bool> isOffline() async {
    await sharedPreferences.reload();
    return sharedPreferences.getBool(_keyStorage) ?? false;
  }
}
