import 'package:shared_preferences/shared_preferences.dart';

class OfflineModeService {
  static bool isOffline = false;
  static bool isChangingPass = false;
  static bool isLogged = false;

  static void setOffline() async {
    var sh = await SharedPreferences.getInstance();
    sh.setBool("offline", true);
    isOffline = true;
  }

  static void setOnline() async {
    var sh = await SharedPreferences.getInstance();
    sh.setBool("offline", false);
    isOffline = false;
  }
}
