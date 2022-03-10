part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class AttemptToLogin extends LoginBlocEvent {
  final String email;
  final String password;
  final bool remember;

  const AttemptToLogin(this.email, this.password, this.remember);
}

class ValidateSavedToken extends LoginBlocEvent {}
