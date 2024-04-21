import '../../../shared/domain/entities/entities.dart';

class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingGetAllRegistersState extends HomeState {}

class SuccessGetAllRegistersState extends HomeState {
  final List<RegistersEntity> data;

  SuccessGetAllRegistersState({required this.data});
}

class FailureHomeState extends HomeState {
  String error;

  FailureHomeState({required this.error});
}
