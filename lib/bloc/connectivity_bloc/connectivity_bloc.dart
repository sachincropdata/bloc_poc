import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription? connectivitySubscription;
  Connectivity connectivity = Connectivity();
  ConnectivityBloc() : super(ConnectivityInitial()) {
    // Emit Connection Lost State when Connection is back online
    on<ConnectivityLostEvent>((event, emit) {
      emit(ConnectivityLostState());
    });

    // Emit Connection Gained State when Connection is back online
    on<ConnectivityGainedEvent>(
        (event, emit) => emit(ConnectivityGainedState()));

    //Listen to connectivity changes
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((event) {});
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
