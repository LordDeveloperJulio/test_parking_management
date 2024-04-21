import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../infra.dart';

class AddRegisterRepositoryImpl implements AddRegisterRepository {
  final AddRegisterRemoteDataSource dataSource;

  AddRegisterRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, AddRegisterEntity>> addRegister({
    required AddRegisterEntity registerVacancyEntity,
  }) async {
    final result = await dataSource.addRegister(
      registerVacancyEntity: registerVacancyEntity,
    );

    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
      (r) {
        try {
          return right(AddRegisterResponse.fromJson(r).toEntity());
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
