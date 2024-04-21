import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/exceptions.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../infra.dart';

class GetListVacancyRepositoryImpl implements GetListVacancyRepository {
  final GetListVacancyRemoteDataSource dataSource;

  GetListVacancyRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, List<VacancyEntity>>> getVacancy() async {
    final result = await dataSource.getVacancy();
    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
      (List<dynamic> list) {
        try {
          List<VacancyEntity> listVacancy = [];
          for (int i = 0; i < list.length; i++) {
            listVacancy.add(VacancyResponse.fromJson(list[i]).toEntity());
          }
          return right(listVacancy);
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
