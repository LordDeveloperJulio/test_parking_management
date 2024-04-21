import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../domain/domain.dart';

abstract class GetListVacancyRepository {
  Future<Either<NetworkExceptions, List<VacancyEntity>>> getVacancy();
}
