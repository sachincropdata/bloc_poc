import 'package:equatable/equatable.dart';

import 'package:bloc_mvvm_poc_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_models.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  var authRepo = AuthRepository();
  int totalPages = 1;
  int currentPage = 1;
  List<UserData> userList = [];

  MainBloc() : super(LoadingState()) {
    on<GetUserList>((event, emit) async {
      await _getUserByPage(currentPage);
    });

    on<ViewMoreButtonEvent>((event, emit) async {
      try {
        _getUserByPage(currentPage);
      } catch (e) {
        emit(LoadingFailedState(e.toString()));
      }
    });
  }

  Future<void> _getUserByPage(int page) async {
    try {
      if (currentPage <= totalPages) {
        emit(LoadingState());
        var usersData = await authRepo.userDataApi(page);
        userList = [...userList, ...usersData.data!];
        emit(LoadedState(userList, false));
        totalPages = usersData.totalPages ?? 0;
        currentPage++;
      } else {
        emit(LoadedState(userList, true));
      }
    } catch (e) {
      emit(LoadingFailedState(e.toString()));
    }
  }
}
