import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class GetListVacancyRemoteDataSource {
  Future<Either<HttpExceptions, List<dynamic>>> getVacancy();
}