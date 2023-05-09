import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_user_bloc_event.dart';
part 'single_user_bloc_state.dart';

class SingleUserBlocBloc
    extends Bloc<SingleUserBlocEvent, SingleUserBlocState> {
  SingleUserBlocBloc() : super(SingleUserBlocInitial()) {
    on<SingleUserBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
