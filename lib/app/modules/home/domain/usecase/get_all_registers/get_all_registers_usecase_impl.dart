import 'package:dartz/dartz.dart';

import '../../../../shared/domain/entities/entities.dart';
import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/infra.dart';
import '../../domain.dart';

class GetAllRegistersUseCaseImpl implements GetAllRegistersUseCase {
  final GetAllRegistersRepository repository;

  GetAllRegistersUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, List<RegistersEntity>>> call({required String param}) async {
    return repository.getAllRegisters(param: param);
  }
}
