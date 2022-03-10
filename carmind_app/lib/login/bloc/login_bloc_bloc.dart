import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    final client = ApiClient(Dio());

    on<LoginBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AttemptToLogin>((event, emit) async {
      emit(LoginLoading());

      await client.login(event.email, event.password).then((value) async {
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
    });
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("on_boarding_finish");
  }
}
