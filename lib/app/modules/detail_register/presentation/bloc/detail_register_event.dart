import '../../../shared/domain/entities/entities.dart';

class DetailRegisterEvent {}

class RegisterUpdateVacancyEvent extends DetailRegisterEvent{
  final RegistersEntity registerVacancyEntity;

  RegisterUpdateVacancyEvent({required this.registerVacancyEntity});
}