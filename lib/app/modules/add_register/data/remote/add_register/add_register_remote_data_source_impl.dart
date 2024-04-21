import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/api_routes.dart';
import '../../../domain/domain.dart';
import 'add_register_remote_data_source.dart';

class AddRegisterRemoteDataSourceImpl implements AddRegisterRemoteDataSource {
  final NetworkClient networkClient;

  AddRegisterRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, Map<dynamic, dynamic>>> addRegister({
    required AddRegisterEntity registerVacancyEntity,
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
