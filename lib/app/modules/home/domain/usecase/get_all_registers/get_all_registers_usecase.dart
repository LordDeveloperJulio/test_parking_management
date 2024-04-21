import 'package:dartz/dartz.dart';

import '../../../../shared/domain/entities/entities.dart';
import '../../../../shared/exceptions/exceptions.dart';

abstract class GetAllRegistersUseCase {
  Future<Either<NetworkExceptions, List<RegistersEntity>>> call({required String param});
}