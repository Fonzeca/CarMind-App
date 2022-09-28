import 'dart:developer';
import 'dart:io';

import 'package:carmind_app/constants.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 403) {
      EasyLoading.showError(expiredSessionError, duration: const Duration(seconds: 3));
      await Future.delayed(const Duration(seconds: 3));
      GetIt.I.get<HomeBloc>().add(LogOutEvent());
    } else if (err.error is SocketException) {
      EasyLoading.showError(noInternet);
      if (!kDebugMode) {
        FirebaseCrashlytics.instance
            .recordError('Ruta: ${err.requestOptions.path} Mensaje: ${err.error.toString()}', StackTrace.current, reason: noInternet);
      }
    } else if (err.response != null) {
      Response r = err.response!;
      if (r.statusCode != 200) {
        String message = r.data.toString();
        if (r.data is Map<String, dynamic> && r.data["message"] != null) {
          message = r.data["message"].toString();
        }
        EasyLoading.showError(message);
      }
      handler.next(err);
    } else {
      EasyLoading.showError(err.message);
      log("message", error: err);
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.uri.path.contains("login") && !options.uri.path.contains("public")) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      String? token = prefs.getString("token");
      options.headers.addAll({'Authorization': "Bearer $token"});
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      String message = response.data.toString();
      if (response.data.message != null) {
        message = response.data.message;
      }
      EasyLoading.showError(message);
    }
    handler.next(response);
  }
}
