part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class GetUserList extends MainEvent {}

class ViewMoreButtonEvent extends MainEvent {}
