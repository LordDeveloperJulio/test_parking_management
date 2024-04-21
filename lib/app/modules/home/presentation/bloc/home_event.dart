abstract class HomeEvent {}

class InitialHomeEvent extends HomeEvent {}

class GetHomeListVacancyEvent extends HomeEvent {
  final String param;

  GetHomeListVacancyEvent({required this.param});
}