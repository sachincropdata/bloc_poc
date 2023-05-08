part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends MainState {}

class LoadedState extends MainState {
  final List<UserData> data;
  final bool noMoreData;
  const LoadedState(this.data, this.noMoreData);
}

class LoadingFailedState extends MainState {
  final String? errorMsg;
  const LoadingFailedState(this.errorMsg);
}

class NoMoreDataState extends MainState {
  final List<UserData> data;
  const NoMoreDataState(this.data);
}
