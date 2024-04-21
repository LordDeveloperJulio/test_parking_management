import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/api_routes.dart';
import '../data.dart';

class GetAllRegistersRemoteDataSourceImpl
    implements GetAllRegistersRemoteDataSource {
  final NetworkClient networkClient;

  GetAllRegistersRemoteDataSourceImpl({
    required this.networkClient,
  });

  @override
  Future<Either<HttpExceptions, List<dynamic>>> getAllRegisters(
      {required String param}) async {
    try {
      final result = await networkClient.get(
        ApiRoutes.getAllRegisters,
        queryParameters: param.isNotEmpty
            ? {
                param: true,
              }
            : null,
      );

      return Right(result.data);
    } on HttpExceptions catch (error) {
      return Left(error);
    }
  }
}
