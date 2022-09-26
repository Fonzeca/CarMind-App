import 'dart:async';
import 'dart:ui';

import 'package:carmind_app/util/offline_managers/background_isolate/sync_manager.dart';
import 'package:carmind_app/util/offline_managers/mock_db.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineBackgroundService {
  final FlutterBackgroundService service;

  OfflineBackgroundService({required this.service});

  Future<void> initializeService() async {
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will be executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );

    service.startService();
    Timer.periodic(const Duration(minutes: 5), (timer) async {
      print("Tratando de iniciar denuevo...");
      service.startService();
    });
  }
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');
  print('FLUTTER BACKGROUND SERVICE START: ${DateTime.now()}');

  var sharedPreferences = await SharedPreferences.getInstance();
  final dir = await getApplicationSupportDirectory();

  var mock = MockDb(sharedPreferences);

  var offlineManager = OfflineManager(sharedPreferences, service);
  var syncManager = SyncManager(
    offlineManager: offlineManager,
    sharedPreferences: sharedPreferences,
    service: service,
    directoryIsar: dir.path,
    mockDb: mock,
  );

  await syncManager.doSync();

  print('FLUTTER BACKGROUND SERVICE END: ${DateTime.now()}');

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  var sharedPreferences = await SharedPreferences.getInstance();
  final dir = await getApplicationSupportDirectory();

  var mock = MockDb(sharedPreferences);

  var offlineManager = OfflineManager(sharedPreferences, service);
  var syncManager = SyncManager(
    offlineManager: offlineManager,
    sharedPreferences: sharedPreferences,
    service: service,
    directoryIsar: dir.path,
    mockDb: mock,
  );

  await syncManager.doSync();
  //El loop del daemon
  Timer.periodic(const Duration(minutes: 5), (timer) async {
    print('FLUTTER BACKGROUND SERVICE START: ${DateTime.now()}');

    await syncManager.doSync();

    print('FLUTTER BACKGROUND SERVICE END: ${DateTime.now()}');
  });
}
