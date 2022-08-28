import 'dart:convert';
import 'dart:typed_data';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/util/custom_dio/interfaces/offline_getter.dart';
import 'package:carmind_app/util/custom_dio/mock_db.dart';
import 'package:carmind_app/util/custom_dio/offline_response.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class OfflineHttpClientAdapter extends DefaultHttpClientAdapter {
  final OfflineGetter getter;
  final MockDb mock;

  final Map<String, List<String>> jsonHeader = const {
    Headers.contentTypeHeader: [Headers.jsonContentType]
  };

  var getEvaluacionByIdRegex = RegExp(r'^\/evaluacion\/(\d+)$');
  var loggedUserRegex = RegExp(r'^\/loggedUser$');
  var realizarEvaluacionRegex = RegExp(r'^\/evaluacion\/(\d+)\/realizar$');
  var getLogEvaluacionByLoggedUserRegex = RegExp(r'^\/evaluacion\/historial\/loggedUser$');

  var getVehiculoByIdRegex = RegExp(r'^\/vehiculo\/(\d+)$');
  var iniciarUsoRegex = RegExp(r'^\/vehiculo\/(\d+)\/iniciarUso$');
  var terminarUsoRegex = RegExp(r'^\/vehiculo\/(\d+)\/terminarUso$');
  var getCurrentRegex = RegExp(r'^\/vehiculo\/current$');

  OfflineHttpClientAdapter({required this.getter, required this.mock}) {
    //Agujero en la seguridad.
    onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    if (await getter.isOffline()) {
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
      }

      throw OfflineResponseError(requestOptions: options, errorText: "No esta disponible en offline mode", statusCode: 500);
    } else {
      return super.fetch(options, requestStream, cancelFuture);
    }
  }

  ResponseBody _createError(RequestOptions options, int statusCode, String errorText) {
    var err = OfflineResponseError(requestOptions: options, errorText: errorText, statusCode: statusCode);
    FirebaseCrashlytics.instance.recordError(err, err.stackTrace);
    return err as ResponseBody;
  }

  Future<ResponseBody> getEvaluacionById(RequestOptions options) async {
    var match = getEvaluacionByIdRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    var evaluacion = await mock.getEvaluacionById(int.parse(id!));
    if (evaluacion == null) {
      return _createError(options, 500, "No se encuentra la evaluacion");
    }
    return OfflineResponseBody.from(jsonEncode(evaluacion), 200, headers: jsonHeader, isRedirect: false);
  }

  Future<ResponseBody> loggedUser(RequestOptions options) async {
    var loggedUser = await mock.getLoggedUser();
    if (loggedUser == null) {
      return _createError(options, 500, "No se encuentra loggedUser");
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
      return _createError(options, 500, "No se pudo completar la evaluacion");
    }
    return OfflineResponseBody.from("", 200, headers: {}, isRedirect: false);
  }

  Future<ResponseBody> getLogEvaluacionByLoggedUser(RequestOptions options) async {
    var logs = await mock.getLogEvaluacionesByLoggedUser("50");
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
    var match = iniciarUsoRegex.allMatches(options.path).elementAt(0);
    var id = match.group(1);

    await mock.terminarUso(int.parse(id!));
    return OfflineResponseBody.from("", 200, headers: {}, isRedirect: false);
  }

  Future<ResponseBody> getCurrent(RequestOptions options) async {
    var vehiculo = await mock.getCurrent();
    return OfflineResponseBody.from(jsonEncode(vehiculo), 200, headers: jsonHeader, isRedirect: false);
  }
}
