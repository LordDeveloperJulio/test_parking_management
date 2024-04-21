import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../infra/infra.dart';
import '../../domain.dart';

class GetVacancyUseCaseImpl implements GetVacancyUseCase {
  final GetListVacancyRepository repository;

  GetVacancyUseCaseImpl({required this.repository});

  @override
  Future<Either<NetworkExceptions, List<VacancyEntity>>> call() async {
    return repository.getVacancy();
  }
}
