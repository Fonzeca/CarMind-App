import 'package:carmind_app/util/offline_managers/background_isolate/background_service.dart';
import 'package:carmind_app/util/offline_managers/main_isolate/client_adapter.dart';
import 'package:carmind_app/util/offline_managers/main_isolate/offline_interceptor.dart';
import 'package:carmind_app/util/offline_managers/mock_db.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineModule {
  late FlutterBackgroundService _service;
  late OfflineManager _offlineManager;
  late MockDb _mock;
  late OfflineHttpClientAdapter _httpClientAdapter;
  late OfflineInterceptor _offlineInterceptor;

  get httpClientAdapter => _httpClientAdapter;
  get offlineInterceptor => _offlineInterceptor;

  OfflineModule({required SharedPreferences sharedPreferences, required Dio dio}) {
    _service = GetIt.I.get<FlutterBackgroundService>();

    _offlineManager = OfflineManager(sharedPreferences, _service);
    _mock = MockDb(sharedPreferences);
    _httpClientAdapter = OfflineHttpClientAdapter(offlineManager: _offlineManager, mock: _mock);
    _offlineInterceptor = OfflineInterceptor(dio: dio, offlineManager: _offlineManager);
    // staticDio?.httpClientAdapter = offlineHttpClientAdapter;
    // staticDio?.interceptors.add(httpInterceptor);

    var offlineBackgroundService = OfflineBackgroundService(service: _service);
    offlineBackgroundService.initializeService();
  }
}
