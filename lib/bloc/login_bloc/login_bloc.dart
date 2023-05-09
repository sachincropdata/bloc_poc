import 'package:bloc_mvvm_poc_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  late TextEditingController emailController, passController;
  late GlobalKey<FormState> formKey;
  AuthRepository? authRepository;
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginSuccessEvent>((event, emit) {
      _onLoginSuccessEvent(event, emit);
    });
    on<LoginFailedEvent>((event, emit) {
      emit(LoginFailedState());
    });
    emailController = TextEditingController();
    passController = TextEditingController();
    formKey = GlobalKey<FormState>();
    authRepository = AuthRepository();
  }

  Future<void> _onLoginSuccessEvent(
      LoginBlocEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginAuthenticatedState());
  }

  Future<void> onLoginButtonTapped() async {
    if (formKey.currentState?.validate() == true) {
      UserCredential? credentials =
          await authRepository?.callLoginMethodViaFirebase(
              email: emailController.text, password: passController.text);

      if (credentials != null) {
        add(LoginSuccessEvent());
      } else {
        add(LoginFailedEvent());
      }
    }
  }
}
