import 'package:bloc_mvvm_poc_app/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_mvvm_poc_app/ui/widgets/medium_vertical_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'widgets/login_page_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginBlocState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is LoginAuthenticatedState) {
            context.go('/home');
          }
          if (state is LoginFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login failed"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: bloc.formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginPageTextField(
                    controller: bloc.emailController,
                    hintText: "Email",
                  ),
                  const MediumVerticalSpacing(),
                  LoginPageTextField(
                    controller: bloc.passController,
                    hintText: "Password",
                  ),
                  const MediumVerticalSpacing(),
                  ElevatedButton(
                    onPressed: () => bloc.onLoginButtonTapped(),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
