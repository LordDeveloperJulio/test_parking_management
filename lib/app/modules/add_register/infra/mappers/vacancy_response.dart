import '../../domain/domain.dart';

class VacancyResponse {
  final int id;
  final int number;
  final String statusVaga;

  VacancyResponse({
    required this.id,
    required this.number,
    required this.statusVaga,
  });

  factory VacancyResponse.fromJson(Map<dynamic, dynamic> json) =>
      VacancyResponse(
        id: json["id"],
        number: json["number"],
        statusVaga: json["statusVaga"],
      );

  VacancyEntity toEntity() {
    return VacancyEntity(
      id: id,
      number: number,
      statusVaga: statusVaga,
    );
  }
}
