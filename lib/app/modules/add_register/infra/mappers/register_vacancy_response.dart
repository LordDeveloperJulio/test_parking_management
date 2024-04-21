import '../../domain/domain.dart';

class AddRegisterResponse {
  final String driverName;
  final String plate;
  final int vacancyId;
  final String dateEntry;
  final String dateExit;

  AddRegisterResponse({
    required this.driverName,
    required this.plate,
    required this.vacancyId,
    required this.dateEntry,
    required this.dateExit,
  });

  factory AddRegisterResponse.fromJson(Map<dynamic, dynamic> json) =>
      AddRegisterResponse(
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

  AddRegisterEntity toEntity() {
    return AddRegisterEntity(
      driverName: driverName,
      plate: plate,
      vacancyId: vacancyId,
      dateEntry: dateEntry,
      dateExit: dateExit,
    );
  }
}
