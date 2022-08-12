import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineModeService {
  static bool offline = false;
  static bool isChangingPass = false;
  static bool isLogged = false;
  static DateTime lastTimeFetched = DateTime.now();

  static bool isOffline({BuildContext? context}) {
    if (context != null && offline && DateTime.now().difference(lastTimeFetched).inMinutes > 2) {
      lastTimeFetched = DateTime.now();
      BlocProvider.of<OfflineBloc>(context).add(SyncOfflineData());
    }
    return offline;
  }

  static void setOffline() async {
    lastTimeFetched = DateTime.now();
    var sh = await SharedPreferences.getInstance();
    sh.setBool("offline", true);
    offline = true;
  }

  static void setOnline() async {
    var sh = await SharedPreferences.getInstance();
    sh.setBool("offline", false);
    offline = false;
  }
}
