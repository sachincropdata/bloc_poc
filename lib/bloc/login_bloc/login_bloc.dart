import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginBlocEvent>((event, emit) {
      _onLoginBlocEvent(event, emit);
    });
  }

  Future<void> _onLoginBlocEvent(
      LoginBlocEvent event, Emitter<LoginBlocState> emit) async {}
}
