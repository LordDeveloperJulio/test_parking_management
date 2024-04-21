import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../domain.dart';

abstract class GetVacancyUseCase {
  Future<Either<NetworkExceptions, List<VacancyEntity>>> call();
}