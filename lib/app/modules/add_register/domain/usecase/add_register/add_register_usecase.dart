import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../domain.dart';

abstract class AddRegisterUseCase {
  Future<Either<NetworkExceptions, AddRegisterEntity>> call({
    required AddRegisterEntity registerVacancyEntity,
  });
}
