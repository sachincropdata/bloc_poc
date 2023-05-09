part of 'login_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginSuccessEvent extends LoginBlocEvent {}

class LoginInitialEvent extends LoginBlocEvent {}

class LoginFailedEvent extends LoginBlocEvent {}
