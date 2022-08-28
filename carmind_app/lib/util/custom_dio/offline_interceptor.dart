import 'dart:io';

import 'package:carmind_app/util/custom_dio/offline_manager.dart';
import 'package:dio/dio.dart';

/// Clase que se dedica solamente a interceptar errores en [onError]
/// para poner la app en modo offline con el manager [offlineManager].
/// Al ya estar offline, llama a [dio] para reintentar la llamada.
class OfflineInterceptor extends Interceptor {
  final Dio dio;
  final OfflineManager offlineManager;

  OfflineInterceptor({required this.dio, required this.offlineManager});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async{
    if (_shouldChangeModeOffline(err)){
      await offlineManager.activateOffline();
      
      //Intentamos otra vez pero con el offline puesto.
      var response = await dio.request(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        options: Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        ),
      );

      return handler.resolve(response);

    }
    return handler.next(err);
  }
}

bool _shouldChangeModeOffline(DioError err) {
  return err.type == DioErrorType.other &&
      err.error != null &&
      err.error is SocketException;
}