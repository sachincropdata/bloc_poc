part of 'single_user_bloc_bloc.dart';

abstract class SingleUserBlocState extends Equatable {
  const SingleUserBlocState();
  
  @override
  List<Object> get props => [];
}

class SingleUserBlocInitial extends SingleUserBlocState {}
