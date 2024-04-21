
abstract class HttpExceptions implements Exception {
  final int? statusCode;
  final Map<String, dynamic>? data;

  HttpExceptions({required this.statusCode, required this.data});
}

class TimeOutException extends HttpExceptions {
  TimeOutException({required super.statusCode, required super.data});

}

class HttpGeneralException extends HttpExceptions {
  HttpGeneralException({required super.statusCode, required super.data});

}