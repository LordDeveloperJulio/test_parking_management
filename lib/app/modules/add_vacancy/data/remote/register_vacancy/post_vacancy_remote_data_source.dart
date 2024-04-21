import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/domain.dart';

abstract class AddVacancyRemoteDataSource {
  Future<Either<HttpExceptions, Map<dynamic, dynamic>>> postAddVacancy({
    required RegisterVacancyEntity registerVacancyEntity,
  });
}