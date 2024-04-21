import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/api_routes.dart';
import '../../../domain/domain.dart';
import 'post_vacancy_remote_data_source.dart';

class AddVacancyRemoteDataSourceImpl implements AddVacancyRemoteDataSource {
  final NetworkClient networkClient;

  AddVacancyRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, Map<dynamic, dynamic>>> postAddVacancy({
    required RegisterVacancyEntity registerVacancyEntity,
  }) async {
    try {
      final result = await networkClient.post(
        ApiRoutes.postRegisterVacancy,
        data: {
          'driverName': registerVacancyEntity.driverName,
          'plate': registerVacancyEntity.plate,
          'vacancyId': registerVacancyEntity.vacancyId,
          'dateEntry': registerVacancyEntity.dateEntry,
          'dateExit': registerVacancyEntity.dateExit,
        },
      );

      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }
}
