import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/util/offline_managers/main_isolate/offline_response.dart';
import 'package:carmind_app/util/offline_managers/mock_db.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class OfflineHttpClientAdapter extends DefaultHttpClientAdapter {
  final OfflineManager offlineManager;
  final MockDb mock;
  late ApiClient api;

  final Map<String, List<String>> jsonHeader = const {
    Headers.contentTypeHeader: [Headers.jsonContentType]
  };

  var loginRegex = RegExp(r'^\/login');
  var getLatestVersionRegex = RegExp(r'^/public/lastVersion_new');

  var getEvaluacionByIdRegex = RegExp(r'^\/evaluacion\/(\d+)$');
  var loggedUserRegex = RegExp(r'^\/loggedUser$');
  var realizarEvaluacionRegex = RegExp(r'^\/evaluacion\/(\d+)\/realizar$');
  var getLogEvaluacionByLoggedUserRegex = RegExp(r'^\/evaluacion\/historial\/loggedUser\?limit=(\d+)$');

  var getVehiculoByIdRegex = RegExp(r'^\/vehiculo\/(\d+)$');
  var iniciarUsoRegex = RegExp(r'^\/vehiculo\/(\d+)\/iniciarUso$');
  var terminarUsoRegex = RegExp(r'^\/vehiculo\/(\d+)\/terminarUso$');
  var getCurrentRegex = RegExp(r'^\/vehiculo\/current$');

  OfflineHttpClientAdapter({required this.offlineManager, required this.mock}) {
    var dio = Dio();

    //Agujero en la seguridad.
    onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    api = ApiClient(dio);
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    if (await offlineManager.isOffline()) {
      validateInternet();

      if (getEvaluacionByIdRegex.hasMatch(options.path)) {
        return await getEvaluacionById(options);
      } else if (loggedUserRegex.hasMatch(options.path)) {
        return await loggedUser(options);
      } else if (realizarEvaluacionRegex.hasMatch(options.path)) {
        return await realizarEvaluacion(options);
      } else if (getLogEvaluacionByLoggedUserRegex.hasMatch(options.path)) {
        return await getLogEvaluacionByLoggedUser(options);
      } else if (getVehiculoByIdRegex.hasMatch(options.path)) {
        return await getVehiculoById(options);
      } else if (iniciarUsoRegex.hasMatch(options.path)) {
        return await iniciarUso(options);
      } else if (terminarUsoRegex.hasMatch(options.path)) {
        return await terminarUso(options);
      } else if (getCurrentRegex.hasMatch(options.path)) {
        return await getCurrent(options);
      } else if (loginRegex.hasMatch(options.path)) {
        return super.fetch(options, requestStream, cancelFuture);
      }
      // else if(getLatestVersionRegex.hasMatch(options.path)){

      // }

      throw OfflineResponseError(requestOptions: options, errorText: "${options.path} no esta disponible en offline mode", statusCode: 500);
    } else {
      return super.fetch(options, requestStream, cancelFuture);
    }
  }

  OfflineResponseError _createError(RequestOptions options, int statusCode, String errorText) {
    var err = OfflineResponseError(requestOptions: options, errorText: errorText, statusCode: statusCode);
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(err, err.stackTrace);
    }
    return err;
  }

  Future<void> validateInternet() async {
    api.valdiateToken().then((value) {
      offlineManager.desactivateOffline();
    }).onError((error, stackTrace) {
      if (error is DioError) {
        if (error.error == null || error.error is! SocketException) {
          offlineManager.desactivateOffline();
        }
      } else {
        offlineManager.desactivateOffline();
      }
    });
  }

  Future<ResponseBody> getEvaluacionById(RequestOptions options) async {
    var match = getEvaluacionByIdRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    var evaluacion = await mock.getEvaluacionById(int.parse(id!));
    if (evaluacion == null) {
      throw _createError(options, 500, "No se encuentra la evaluacion");
    }
    return OfflineResponseBody.from(jsonEncode(evaluacion), 200, headers: jsonHeader, isRedirect: false);
  }

  Future<ResponseBody> loggedUser(RequestOptions options) async {
    var loggedUser = await mock.getLoggedUser();
    if (loggedUser == null) {
      throw _createError(options, 500, "No se encuentra loggedUser");
    }
    return OfflineResponseBody.from(jsonEncode(loggedUser), 200, headers: jsonHeader, isRedirect: false);
  }

  Future<ResponseBody> realizarEvaluacion(RequestOptions options) async {
    var match = realizarEvaluacionRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    EvaluacionTerminadaPojo evTerminada = EvaluacionTerminadaPojo.fromJson(options.data);
    try {
      await mock.realizarEvaluacion(int.parse(id!), evTerminada);
    } catch (e) {
      throw _createError(options, 500, "No se pudo completar la evaluacion");
    }
    return OfflineResponseBody.from("", 200, headers: {}, isRedirect: false);
  }

  Future<ResponseBody> getLogEvaluacionByLoggedUser(RequestOptions options) async {
    var match = getLogEvaluacionByLoggedUserRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);
    var logs = await mock.getLogEvaluacionesByLoggedUser(id!);
    return OfflineResponseBody.from(jsonEncode(logs), 200, headers: jsonHeader, isRedirect: false);
  }

  Future<ResponseBody> getVehiculoById(RequestOptions options) async {
    var match = getVehiculoByIdRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    var vehiculo = await mock.getVehiculoById(int.parse(id!));
    return OfflineResponseBody.from(jsonEncode(vehiculo), 200, headers: jsonHeader, isRedirect: false);
  }

  Future<ResponseBody> iniciarUso(RequestOptions options) async {
    var match = iniciarUsoRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    await mock.iniciarUso(int.parse(id!));
    return OfflineResponseBody.from("", 200, headers: {}, isRedirect: false);
  }

  Future<ResponseBody> terminarUso(RequestOptions options) async {
    var match = terminarUsoRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    await mock.terminarUso(int.parse(id!));
    return OfflineResponseBody.from("", 200, headers: {}, isRedirect: false);
  }

  Future<ResponseBody> getCurrent(RequestOptions options) async {
    var vehiculo = await mock.getCurrent();
    return OfflineResponseBody.from(jsonEncode(vehiculo), 200, headers: jsonHeader, isRedirect: false);
  }
}
