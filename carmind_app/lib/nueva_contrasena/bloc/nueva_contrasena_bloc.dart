import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/api_client.dart';
import '../../api/pojo/profile/recover_password_user.dart';
import '../../main.dart';

part 'nueva_contrasena_event.dart';
part 'nueva_contrasena_state.dart';

class NuevaConstrasenaBloc extends Bloc<NuevaConstrasenaEvent, NuevaContrasenaState> {
  NuevaConstrasenaBloc() : super(const NuevaConstrasenaInitial()) {
     final client = ApiClient(staticDio!);

    on<RestaurarContrasenaEvent>((event, emit) async {
        await client.recuperarContrasena(event.email);
        emit(state.copyWith(email: event.email, inputChangedValue: false, timeLeft: -1));
    });

    on<StartCountEvent>((event, emit){
      double time = 0;
      add(IncrementCountEvent(time));
      Timer.periodic(const Duration(seconds: 1), 
        (Timer timer) {
          if(time >= 60){
            time = -2;
            timer.cancel();
          }else{
            time ++;
          }
          add(IncrementCountEvent(time));
      });
    });

    on<IncrementCountEvent>((event, emit) async  {
        emit(state.copyWith(timeLeft: event.timeLeft));
    });

    on<VerificarCodigoEvent>((event, emit) async  {
      RecoverPasswordUserPojo pojo = RecoverPasswordUserPojo();
      pojo.email = event.email;
      pojo.token = event.codigo;
      await client.validateRecoverToken(pojo);
      emit(state.copyWith(codigo: event.codigo, inputChangedValue: false));
    });

    on<CambiarContrasenaEvent>((event, emit) async  {
      RecoverPasswordUserPojo pojo = RecoverPasswordUserPojo();
      pojo.email = event.email;
      pojo.token = event.codigo;
      pojo.newPassword =  event.newPass;
      await client.resetPassword(pojo);
      emit(state.copyWith(newPass: event.newPass, inputChangedValue: false));
    });

    on<NuevaContrasenaEnPrimerLoginEvent>((event, emit) async  {
      await client.newPasswordAtFirstLogin(event.newPass);
      emit(state.copyWith(newPass: event.newPass, inputChangedValue: false));
    });

    on<InputValueChangedEvent>(((event, emit) {
      emit(state.copyWith(inputChangedValue: true, arePassEquals: true));
    }));

    on<ArePassNotEqualsEvent>(((event, emit) {
      emit(state.copyWith(arePassEquals: false, inputChangedValue: true));
    }));

    on<PopEvent>(((event, emit) {
      emit(state.copyWith(email: '', arePassEquals: true, codigo: '', inputChangedValue: false, newPass: ''));
    }));



  }
}

