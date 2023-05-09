part of 'login_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginAuthenticatedState extends LoginBlocState {}

class LoginUnAuthenticatedState extends LoginBlocState {}

class LoginFailedState extends LoginBlocState {}
