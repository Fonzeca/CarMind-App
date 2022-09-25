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
  const ValidateSavedToken();
}

class ResetScreen extends LoginEvent {}
