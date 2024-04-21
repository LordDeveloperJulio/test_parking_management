import '../../domain/entities/entities.dart';

class RegistersResponse {
  final int id;
  final String driverName;
  final String plate;
  final int vacancyId;
  final String? dateEntry;
  final String? dateExit;

  RegistersResponse({
    required this.id,
    required this.driverName,
    required this.plate,
    required this.vacancyId,
    required this.dateEntry,
    required this.dateExit,
  });

  factory RegistersResponse.fromJson(Map<dynamic, dynamic> json) =>
      RegistersResponse(
        id: json["id"],
        driverName: json["driverName"],
        plate: json["plate"],
        vacancyId: json["vacancyId"],
        dateEntry: json["dateEntry"],
        dateExit: json["dateExit"],
      );

  RegistersEntity toEntity() {
    return RegistersEntity(
      id: id,
      driverName: driverName,
      plate: plate,
      vacancyId: vacancyId,
      dateEntry: dateEntry,
      dateExit: dateExit,
    );
  }
}
