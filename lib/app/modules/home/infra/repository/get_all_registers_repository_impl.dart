import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';
import '../../../shared/infra/mappers/mappers.dart';
import '../../data/data.dart';
import '../infra.dart';

class GetAllRegistersRepositoryImpl implements GetAllRegistersRepository {
  final GetAllRegistersRemoteDataSource dataSource;

  GetAllRegistersRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<NetworkExceptions, List<RegistersEntity>>> getAllRegisters({required String param}) async {
    final result = await dataSource.getAllRegisters(param: param);
    return result.fold(
      (HttpExceptions exception) {
        return left(verifyException(
            statusCode: exception.statusCode, data: exception.data));
      },
          (List<dynamic> list) {
        try {
          List<RegistersEntity> listRegisters = [];
          for (int i = 0; i < list.length; i++) {
            listRegisters.add(RegistersResponse.fromJson(list[i]).toEntity());
          }
          return right(listRegisters);
        } catch (e) {
          return left(NetworkUnknownException());
        }
      },
    );
  }
}
