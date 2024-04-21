import 'package:dartz/dartz.dart';

import '../../../../shared/domain/entities/entities.dart';
import '../../../../shared/exceptions/exceptions.dart';

abstract class UpdateRegisterRepository {
  Future<Either<NetworkExceptions, RegistersEntity>> updateRegister({
    required RegistersEntity registerVacancyEntity,
  });
}