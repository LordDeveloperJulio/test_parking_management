import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';

abstract class UpdateRegisterUseCase {
  Future<Either<NetworkExceptions, RegistersEntity>> call({
    required RegistersEntity registerVacancyEntity,
  });
}
