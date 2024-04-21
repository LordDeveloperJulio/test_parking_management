import '../../domain/domain.dart';

class RegisterVacancyResponse {
  final String driverName;
  final String plate;
  final int vacancyId;
  final String dateEntry;
  final String dateExit;

  RegisterVacancyResponse({
    required this.driverName,
    required this.plate,
    required this.vacancyId,
    required this.dateEntry,
    required this.dateExit,
  });

  factory RegisterVacancyResponse.fromJson(Map<dynamic, dynamic> json) =>
      RegisterVacancyResponse(
        driverName: json["driverName"],
        plate: json["plate"],
        vacancyId: json["vacancyId"],
        dateEntry: json["dateEntry"],
        dateExit: json["dateExit"],
      );

  Map<String, dynamic> toMap() {
    return {
      'driverName': driverName,
      'plate': plate,
      'vacancyId': vacancyId,
      'dateEntry': dateEntry,
      'dateExit': dateExit,
    };
  }

  RegisterVacancyEntity toEntity() {
    return RegisterVacancyEntity(
      driverName: driverName,
      plate: plate,
      vacancyId: vacancyId,
      dateEntry: dateEntry,
      dateExit: dateExit,
    );
  }
}
