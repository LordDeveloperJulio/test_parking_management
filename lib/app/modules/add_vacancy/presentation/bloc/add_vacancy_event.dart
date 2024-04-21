import 'package:test_parking_management/app/modules/add_vacancy/domain/domain.dart';

class AddVacancyEvent {}

class GetAddVacancyEvent extends AddVacancyEvent{}

class RegisterVacancyEvent extends AddVacancyEvent{
  final RegisterVacancyEntity registerVacancyEntity;

  RegisterVacancyEvent({required this.registerVacancyEntity});
}