import 'package:bloc_mvvm_poc_app/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_mvvm_poc_app/ui/widgets/medium_vertical_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/login_page_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.bloc});
  final LoginBloc? bloc;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController, _passController;
  late GlobalKey<ScaffoldState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _formKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: BlocConsumer<LoginBloc, LoginBlocState>(
          bloc: widget.bloc,
          listener: (context, state) {
            // TODO: @hrithikm2cd Add listener logic here.
          },
          builder: (context, state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginPageTextField(
                  controller: _emailController,
                  hintText: "Email",
                ),
                const MediumVerticalSpacing(),
                LoginPageTextField(
                  controller: _passController,
                  hintText: "Password",
                ),
                const MediumVerticalSpacing(),
                ElevatedButton(
                  onPressed: () => widget.bloc?.add(LoginSuccessEvent()),
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
        ),
      ),
    );
  }
}
