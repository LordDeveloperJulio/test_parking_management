import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllRegistersRemoteDataSource {
  Future<Either<HttpExceptions, List<dynamic>>> getAllRegisters({required String param});
}