import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/infra.dart';
import '../../domain.dart';

class AddRegisterUseCaseImpl implements AddRegisterUseCase {
  final AddRegisterRepository repository;

  AddRegisterUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, AddRegisterEntity>> call(
      {required AddRegisterEntity registerVacancyEntity}) async {
    return repository.addRegister(registerVacancyEntity: registerVacancyEntity);
  }
}
