
import '../enums/http_request_method.dart';

class HttpRequestParams {
  final String path;
  final Map<String, dynamic>? headers;
  final HttpRequestMethod method;
  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? body;

  HttpRequestParams({
    required this.path,
    this.headers,
    required this.method,
    this.body,
    this.queryParams,
  });
}