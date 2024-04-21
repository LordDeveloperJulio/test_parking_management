import '../../domain/domain.dart';

class AddVacancyState {}

class InitialAddVacancyState extends AddVacancyState {}

class LoadingAddVacancyState extends AddVacancyState {}

class SuccessAddVacancyState extends AddVacancyState {
  final RegisterVacancyEntity data;

  SuccessAddVacancyState({required this.data});
}

class SuccessListVacancyState extends AddVacancyState {
  final List<VacancyEntity> data;

  SuccessListVacancyState({required this.data});
}

class FailureAddVacancyState extends AddVacancyState {
  String error;

  FailureAddVacancyState({required this.error});
}
