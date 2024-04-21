import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/entities/entities.dart';
import '../../../../shared/exceptions/exceptions.dart';
import '../../../../shared/infra/mappers/mappers.dart';
import '../../../data/data.dart';
import 'update_register_repository.dart';

class UpdateRegisterRepositoryImpl implements UpdateRegisterRepository {
  final UpdateRegisterRemoteDataSource dataSource;

  UpdateRegisterRepositoryImpl({
    required this.dataSource,
  });

//   @override
//   Future<Either<NetworkExceptions, RegistersEntity>> updateRegister({
//     required RegistersEntity registerVacancyEntity,
//   }) async {
//     final result = await dataSource.updateRegister(
//       registerVacancyEntity: registerVacancyEntity,
//     );
//
//     return result.fold((Exception exception) {
//       return left(exception as NetworkExceptions);
//     }, (r) {
//       return right(RegistersResponse.fromJson(r).toEntity());
//     });
//   }
// }

  @override
  Future<Either<NetworkExceptions, RegistersEntity>> updateRegister({
    required RegistersEntity registerVacancyEntity,
  }) async {
    final result = await dataSource.updateRegister(
      registerVacancyEntity: registerVacancyEntity,
    );

    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
      (r) {
        try {
          return right(RegistersResponse.fromJson(r).toEntity());
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
