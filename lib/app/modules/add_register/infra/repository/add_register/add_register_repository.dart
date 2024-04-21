import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../domain/domain.dart';

abstract class AddRegisterRepository {
  Future<Either<NetworkExceptions, AddRegisterEntity>> addRegister({
    required AddRegisterEntity registerVacancyEntity,
  });
}
