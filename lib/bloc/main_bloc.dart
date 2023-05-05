import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_mvvm_poc_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_models.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  var authRepo = AuthRepository();
  MainBloc() : super(LodedingState()) {
    on<GetUserList>((event, emit) async {
      emit(LodedingState());
      try {
        var userList = await authRepo.userDataApi();
        emit(LodededState(userList.data!));
      } catch (e) {
        emit(LodedingFailedState(e.toString()));
      }
    });

    on<ViewMoreButtonEvent>((event, emit) => {});
  }
}
