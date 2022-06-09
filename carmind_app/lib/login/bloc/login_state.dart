part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginState {}

class LoginOk extends LoginState {}

class FirstLogin extends LoginState{}

class LoginError extends LoginState {
  final String error;

  const LoginError(this.error);
}
