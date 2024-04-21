import '../../../shared/domain/entities/entities.dart';

class DetailRegisterState {}

class InitialDetailRegisterState extends DetailRegisterState {}

class LoadingDetailRegisterState extends DetailRegisterState {}

class SuccessUpdateRegisterState extends DetailRegisterState {
  final RegistersEntity data;

  SuccessUpdateRegisterState({required this.data});
}

class FailureDetailRegisterState extends DetailRegisterState {
  String error;

  FailureDetailRegisterState({required this.error});
}
