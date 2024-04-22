import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../../common/api_routes.dart';
import '../../../../shared/domain/entities/entities.dart';
import 'update_register_remote_data_source.dart';

class UpdateRegisterRemoteDataSourceImpl implements UpdateRegisterRemoteDataSource {
  final NetworkClient networkClient;

  UpdateRegisterRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, Map<dynamic, dynamic>>> updateRegister({
    required RegistersEntity registerVacancyEntity,
  }) async {
    try {
      final result = await networkClient.put(
        ApiRoutes.updateRegister,
        data: {
          'id': registerVacancyEntity.id,
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