import '../../domain/domain.dart';

class AddRegisterState {}

class InitialAddRegisterState extends AddRegisterState {}

class LoadingAddRegisterState extends AddRegisterState {}

class SuccessAddRegisterState extends AddRegisterState {
  final AddRegisterEntity data;

  SuccessAddRegisterState({required this.data});
}

class SuccessListVacancyState extends AddRegisterState {
  final List<VacancyEntity> data;

  SuccessListVacancyState({required this.data});
}

class FailureAddRegisterState extends AddRegisterState {
  String error;

  FailureAddRegisterState({required this.error});
}
