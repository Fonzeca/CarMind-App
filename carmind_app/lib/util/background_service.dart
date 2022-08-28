import 'dart:async';
import 'dart:ui';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/util/custom_dio/mock_db.dart';
import 'package:carmind_app/util/custom_dio/offline_manager.dart';
import 'package:carmind_app/util/custom_dio/sync_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineBackgroundService {
  final MockDb mock;
  final FlutterBackgroundService service;

  OfflineBackgroundService({required this.mock, required this.service});

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

    service.on(SyncManager.SYNC_MEESSAGE).listen((event) {
      if (event != null) {
        mock.saveData(OfflineData.fromJson(event));
      }
    });

    service.startService();
  }
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch
bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');

  return true;
}

void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
      service.setForegroundNotificationInfo(
        title: "FOREGROUND",
        content: "Updated at ${DateTime.now()}",
      );
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
      service.setForegroundNotificationInfo(
        title: "BACKGROUND",
        content: "Updated at ${DateTime.now()}",
      );
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  await Hive.initFlutter();
  Hive.registerAdapter(VehiculoAdapter());

  var sharedPreferences = await SharedPreferences.getInstance();

  var offlineManager = OfflineManager(sharedPreferences);
  var syncManager = SyncManager(offlineManager: offlineManager, sharedPreferences: sharedPreferences, service: service);

  final dir = await getApplicationSupportDirectory();

  // Open Isar in the UI isolate
  final isarDb = await Isar.open(
    name: 'myInstance',
    schemas: [VehiculoSchema],
    directory: dir.path,
  );

  //El loop del daemon
  Timer.periodic(const Duration(seconds: 5), (timer) async {
    print('FLUTTER BACKGROUND SERVICE START: ${DateTime.now()}');
    // if (service is AndroidServiceInstance) {
    //   service.setForegroundNotificationInfo(
    //     title: "My App Service",
    //     content: "Updated at ${DateTime.now()}",
    //   );
    // }
    isarDb.vehiculos.count();

    if (await isarDb.vehiculos.count() != 0) {
      print("VEHICULO: ${(await isarDb.vehiculos.where().findFirst())!.nombre}");
    }

    await syncManager.doSync();

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE END: ${DateTime.now()}');
  });
}
