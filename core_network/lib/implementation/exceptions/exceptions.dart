abstract class Exceptions {
  final String? message;

  Exceptions({required this.message});
}

class SetHeadersException extends Exceptions {
  SetHeadersException({String? message}) : super(message: message);
}