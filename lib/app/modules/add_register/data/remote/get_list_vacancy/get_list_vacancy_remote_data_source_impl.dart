import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../../common/api_routes.dart';
import '../../data.dart';

class GetListVacancyRemoteDataSourceImpl
    implements GetListVacancyRemoteDataSource {
  final NetworkClient networkClient;

  GetListVacancyRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, List<dynamic>>> getVacancy() async {
    try {
      final result = await networkClient.get(ApiRoutes.getAllVacancy);

      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }
}
