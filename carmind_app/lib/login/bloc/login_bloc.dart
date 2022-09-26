import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/constants.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/services/services.dart';
import 'package:carmind_app/util/offline_managers/background_isolate/sync_manager.dart';
import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/pojo/login_pojo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginBlocInitial()) {
    final client = ApiClient(staticDio!);

    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AttemptToLogin>((event, emit) async {
      EasyLoading.show();
      final String email = event.email.trim();
      final String pass = event.password.trim();
      var sh = await SharedPreferences.getInstance();

      FirebaseCrashlytics.instance.setUserIdentifier(email);
      final String? fcmToken = PushNotificationsService.token;

      try {
        TokenLogin tokenLogin = await client.login(email, pass, fcmToken ?? '');
        await saveToken(tokenLogin.token!);

        var service = GetIt.I.get<FlutterBackgroundService>();

        service.invoke(SyncManager.MANUALLY_SYNC);

        if (await OfflineManager(sh, service).isOffline()) {
          await OfflineManager(sh, service).desactivateOffline();
        }

        //TODO borrar esto en el proximo update
        bool isFCMNeeded = isFCMTokenNeeded(sh);
        if (fcmToken != null && isFCMNeeded) await saveNeedFCMToken();

        if (tokenLogin.mustChangePassword!) {
          emit(FirstLogin());
        } else {
          emit(LoginOk());
        }
        EasyLoading.dismiss();
      } on DioError catch (e) {
        removeToken();
        if (e.response != null && e.response!.statusCode == 400) {
          FirebaseCrashlytics.instance
              .recordError('Ruta: ${e.requestOptions.path} Mensaje: ${e.error.toString()}', StackTrace.current, reason: noInternet);
        }
      } on Exception catch (e) {
        removeToken();
        FirebaseCrashlytics.instance.recordError('Detalles: ${e.toString()}', StackTrace.current, reason: 'Error al intentar logearse');
      }
    });

    on<ValidateSavedToken>((event, emit) async {
      EasyLoading.show();

      var sh = await SharedPreferences.getInstance();
      bool isFCMNeeded = isFCMTokenNeeded(sh);

      if (isFCMNeeded) {
        EasyLoading.dismiss();
        emit(LoginBlocInitial());
        return;
      }
      var service = GetIt.I.get<FlutterBackgroundService>();

      OfflineManager offlineManager = OfflineManager(sh, service);

      if (await offlineManager.isOffline()) {
        if (await verifyToken()) {
          EasyLoading.dismiss();
          emit(LoginOk());
          return;
        }
        emit(LoginBlocInitial());
      }

      if (await verifyToken()) {
        //Llamo a la api para asegurarme que el token anda
        await client.valdiateToken().then((value) {
          emit(LoginOk());
        }).catchError((obj) {
          removeToken();
          emit(LoginBlocInitial());
        });
      } else {
        emit(LoginBlocInitial());
      }

      EasyLoading.dismiss();
    });

    on<ResetScreen>((event, emit) {
      emit(LoginBlocInitial());
    });
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    // prefs.remove("on_boarding_finish");
  }

  Future<bool> verifyToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token");
  }

  saveNeedFCMToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFCMNeeded", true);
  }

  bool isFCMTokenNeeded(sh) {
    return !sh.containsKey("isFCMNeeded");
  }
}
