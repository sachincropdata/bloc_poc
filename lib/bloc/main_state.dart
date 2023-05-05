part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object?> get props => [];
}

class LodedingState extends MainState {}

class LodededState extends MainState {
  final List<Data> data;
  const LodededState(this.data);
}

class LodedingFailedState extends MainState {
  final String? errorMsg;
  const LodedingFailedState(this.errorMsg);
}
