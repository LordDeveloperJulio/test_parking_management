import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/entities/entities.dart';

abstract class UpdateRegisterRemoteDataSource {
  Future<Either<HttpExceptions, Map<dynamic, dynamic>>> updateRegister({
    required RegistersEntity registerVacancyEntity,
  });
}