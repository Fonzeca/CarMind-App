import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    final client = ApiClient(Dio());
    final clientConToken = ApiClient(staticDio!);

    on<LoginBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AttemptToLogin>((event, emit) async {
      emit(LoginLoading());

      await client.login(event.email.trim(), event.password.trim()).then((value) async {
        await saveToken(value.token!);

        emit(LoginOk());
      }).onError((error, stackTrace) {
        removeToken();
        log("HUBO UN ERROR");
        emit(const LoginError("Completa la información"));
      });
    });

    on<ValidateSavedToken>((event, emit) async {
      emit(LoginLoading());

      //Si el inicio de sesion es para ponerlo en online, no verificamos si esta offline, porque si esta.
      if (!event.offlineMode) {
        //Verifico si pasa offline
        var sh = await SharedPreferences.getInstance();
        var offline = sh.getBool("offline");

        if (offline!) {
          emit(LoginOk());
          return;
        }
      }

      if (await verifyToken()) {
        //Llamo a la api para asegurarme que el token anda
        await clientConToken.valdiateToken().then((value) {
          emit(LoginOk());
        }).catchError((obj) {
          removeToken();
          emit(LoginBlocInitial());
        });
      } else {
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
}
