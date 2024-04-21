import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';
import '../../infra/infra.dart';
import 'update_register_usecase.dart';

class UpdateRegisterUseCaseImpl implements UpdateRegisterUseCase {
  final UpdateRegisterRepository repository;

  UpdateRegisterUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, RegistersEntity>> call(
      {required RegistersEntity registerVacancyEntity}) async {
    return repository.updateRegister(registerVacancyEntity: registerVacancyEntity);
  }
}
