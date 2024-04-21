class RegisterVacancyEntity {
  final String driverName;
  final String plate;
  final int vacancyId;
  final String? dateEntry;
  final String? dateExit;

  RegisterVacancyEntity({
    required this.driverName,
    required this.plate,
    required this.vacancyId,
    required this.dateEntry,
    required this.dateExit,
  });
}
