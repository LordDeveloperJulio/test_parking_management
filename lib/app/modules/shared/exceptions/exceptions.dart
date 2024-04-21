abstract class NetworkExceptions {
  final String? message;
  final Map<String, dynamic>? data;

  NetworkExceptions({required this.message, this.data});
}

class NetworkBadRequestException extends NetworkExceptions {
  NetworkBadRequestException() : super(message: 'Bad Request');
}

class NetworkUnauthorizedException extends NetworkExceptions {
  NetworkUnauthorizedException() : super(message: 'Unauthorized');
}

class NetworkNotFoundException extends NetworkExceptions {
  NetworkNotFoundException() : super(message: 'Not found');
}

class NoConnectionException extends NetworkExceptions {
  NoConnectionException() : super(message: 'No connection');
}

class NetworkNotAcceptableException extends NetworkExceptions {
  final Map<String, dynamic>? data;

  NetworkNotAcceptableException({required this.data}) : super(message: 'Not Acceptable');
}

class NetworkUnknownException extends NetworkExceptions {
  NetworkUnknownException() : super(message: 'Not found');
}

NetworkExceptions verifyException(
    {required int? statusCode, Map<String, dynamic>? data}) {
  switch (statusCode) {
    case 400:
      return NetworkBadRequestException();
    case 401:
      return NetworkUnauthorizedException();
    case 404:
      return NetworkNotFoundException();
    case 406:
      return NetworkNotAcceptableException(data: data);
    default:
      return NetworkUnknownException();
  }
}