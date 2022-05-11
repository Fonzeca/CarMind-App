import 'package:bloc/bloc.dart';
import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    final client = ApiClient(staticDio!);

    on<LoginBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AttemptToLogin>((event, emit) async {
      EasyLoading.show();

      await client.login(event.email.trim(), event.password.trim()).then((value) async {
        await saveToken(value.token!);

        emit(LoginOk());
        EasyLoading.dismiss();
      }).onError((error, stackTrace) {
        removeToken();
      });
    });

    on<ValidateSavedToken>((event, emit) async {
      EasyLoading.show();

      //Si el inicio de sesion es para ponerlo en online, no verificamos si esta offline, porque si esta.
      if (!event.offlineMode) {
        //Verifico si pasa offline
        var sh = await SharedPreferences.getInstance();
        var offline = sh.getBool("offline");

        if (offline != null && offline) {
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
}
