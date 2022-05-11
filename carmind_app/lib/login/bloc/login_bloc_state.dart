part of 'login_bloc_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginOk extends LoginBlocState {}

class LoginError extends LoginBlocState {
  final String error;

  const LoginError(this.error);
}
