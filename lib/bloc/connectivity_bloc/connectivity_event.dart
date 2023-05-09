part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityGainedEvent extends ConnectivityEvent {}

class ConnectivityLostEvent extends ConnectivityEvent {}
