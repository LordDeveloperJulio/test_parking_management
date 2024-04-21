import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../infra.dart';

class AddVacancyRepositoryImpl implements AddVacancyRepository {
  final AddVacancyRemoteDataSource dataSource;

  AddVacancyRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, RegisterVacancyEntity>> postVacancy({
    required RegisterVacancyEntity registerVacancyEntity,
  }) async {
    final result = await dataSource.postAddVacancy(
      registerVacancyEntity: registerVacancyEntity,
    );

    return result.fold((Exception exception) {
      return left(exception as NetworkExceptions);
    }, (r) {
      return right(RegisterVacancyResponse.fromJson(r).toEntity());
    });
  }
}
