import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/infra.dart';
import '../../domain.dart';

class PostVacancyUseCaseImpl implements PostVacancyUseCase {
  final AddVacancyRepository repository;

  PostVacancyUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, RegisterVacancyEntity>> call(
      {required RegisterVacancyEntity registerVacancyEntity}) async {
    return repository.postVacancy(registerVacancyEntity: registerVacancyEntity);
  }
}
