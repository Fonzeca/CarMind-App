import 'package:carmind_app/profile/bloc/offline_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineModeService {
  static bool offline = false;
  static bool isChangingPass = false;
  static bool isLogged = false;
  static bool syncAvailable = true;

  static bool isOffline({BuildContext? context}) {
    if (context == null) {
      return offline;
    }
    final OfflineBloc offlineBloc = BlocProvider.of<OfflineBloc>(context);
    if (offline &&
        (offlineBloc.state.newLogsEvaluaciones.isNotEmpty || offlineBloc.state.newLogsUso.isNotEmpty) &&
        OfflineModeService.syncAvailable) {
      OfflineModeService.syncAvailable = false;
      offlineBloc.add(SyncOfflineData());
    }
    return offline;
  }

  static void setOffline() async {
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
