import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';

abstract class GetAllRegistersRepository {
  Future<Either<NetworkExceptions, List<RegistersEntity>>> getAllRegisters({required String param});
}
