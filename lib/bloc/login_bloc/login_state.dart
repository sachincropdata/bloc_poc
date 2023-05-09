part of 'login_bloc.dart';

abstract class LoginBlocState {
  const LoginBlocState();
}

class LoginBlocInitial extends LoginBlocState {}

class LoginAuthenticatedState extends LoginBlocState {}

class LoginUnAuthenticatedState extends LoginBlocState {}

class LoginFailedState extends LoginBlocState {}
