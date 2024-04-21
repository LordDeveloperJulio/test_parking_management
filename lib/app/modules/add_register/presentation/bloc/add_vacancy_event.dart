import '../../domain/domain.dart';

class AddRegisterEvent {}

class GetAddRegisterEvent extends AddRegisterEvent{}

class RegisterVacancyEvent extends AddRegisterEvent{
  final AddRegisterEntity registerVacancyEntity;

  RegisterVacancyEvent({required this.registerVacancyEntity});
}