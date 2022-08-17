import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/pojo/login_pojo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginBlocInitial()) {
    final client = ApiClient(staticDio!);

    on<AttemptToLogin>((event, emit) async {
      OfflineModeService.isChangingPass = false;
      EasyLoading.show();
      final String email = event.email.trim();
      final String pass = event.password.trim();

      FirebaseCrashlytics.instance.setUserIdentifier(email);
      final String? fcmToken = await FirebaseMessaging.instance.getToken();

      try {
        TokenLogin tokenLogin = await client.login(email, pass, fcmToken ?? '');
        await saveToken(tokenLogin.token!);

        //TODO borrar esto en el proximo update
        var sh = await SharedPreferences.getInstance();
        bool isFCMNeeded = isFCMTokenNeeded(sh);
        if (fcmToken != null && isFCMNeeded) await saveNeedFCMToken();

        if (tokenLogin.mustChangePassword!) {
          emit(FirstLogin());
        } else {
          emit(LoginOk());
        }
      } on Exception catch (e) {
        removeToken();
        FirebaseCrashlytics.instance.recordError('Detalles: ${e.toString()}', StackTrace.current, reason: 'Error al intentar logearse');
      }
    });

    on<ValidateSavedToken>((event, emit) async {
      OfflineModeService.isChangingPass = false;
      EasyLoading.show();

      if (OfflineModeService.isOffline()) {
        EasyLoading.dismiss();
        emit(LoginOk());
        return;
      }

      var sh = await SharedPreferences.getInstance();
      bool isFCMNeeded = isFCMTokenNeeded(sh);

      if (isFCMNeeded) {
        EasyLoading.dismiss();
        emit(LoginBlocInitial());
        return;
      }

      if (await verifyToken()) {
        //Llamo a la api para asegurarme que el token anda
        await client.valdiateToken().then((value) async {
          EasyLoading.dismiss();
          emit(LoginOk());
        }).catchError((obj) {
          removeToken();
          EasyLoading.dismiss();
          emit(LoginBlocInitial());
        });
      } else {
        EasyLoading.dismiss();
        emit(LoginBlocInitial());
      }
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
