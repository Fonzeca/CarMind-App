part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AttemptToLogin extends LoginEvent {
  final String email;
  final String password;

  const AttemptToLogin(this.email, this.password);
}

class ValidateSavedToken extends LoginEvent {
  //Con este flag va a saber si preguntar si esta modo offline o no.
  //Si esta en true, NO pregunta si esta en offline, y va directamente por internet.
  final offlineMode;

  const ValidateSavedToken(this.offlineMode);
}

class ResetScreen extends LoginEvent {}
