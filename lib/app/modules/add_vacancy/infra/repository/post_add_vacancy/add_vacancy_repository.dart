import 'package:dartz/dartz.dart';
import 'package:test_parking_management/app/modules/add_vacancy/domain/domain.dart';

import '../../../../shared/exceptions/exceptions.dart';

abstract class AddVacancyRepository {
  Future<Either<NetworkExceptions, RegisterVacancyEntity>> postVacancy({
    required RegisterVacancyEntity registerVacancyEntity,
  });
}
