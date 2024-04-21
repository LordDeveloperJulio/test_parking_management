import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../domain.dart';

abstract class PostVacancyUseCase {
  Future<Either<NetworkExceptions, RegisterVacancyEntity>> call({
    required RegisterVacancyEntity registerVacancyEntity,
  });
}
