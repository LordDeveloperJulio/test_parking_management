import 'package:dio/dio.dart';

import '../../api/network_client.dart';
import '../../api/models/http_request_params.dart';
import '../../api/models/http_response.dart';
import '../../api/enums/http_request_method.dart';
import '../exceptions/exceptions.dart';
import '../exceptions/http_exceptions.dart';

class DioNetworkClient implements NetworkClient {
  final Dio dio;

  DioNetworkClient(this.dio);

  @override
  Future<HttpResponse> request(HttpRequestParams request) async {
    try {
      final response = await dio.request(
        request.path,
        data: request.body,
        queryParameters: request.queryParams,
        options: Options(method: request.method.name, headers: request.headers),
      );

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.receiveTimeout) {
        throw TimeOutException(data: error.response?.data, statusCode: error.response?.statusCode);
      }
      throw HttpGeneralException(data: error.response?.data, statusCode: error.response?.statusCode);
    }
  }

  @override
  Future<HttpResponse> get(String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request(HttpRequestParams(
      path: path,
      method: HttpRequestMethod.get,
      queryParams: queryParameters,
      headers: headers,
    ));
  }

  @override
  Future<HttpResponse> post(String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request(HttpRequestParams(
      path: path,
      method: HttpRequestMethod.post,
      body: data,
      queryParams: queryParameters,
      headers: headers,
    ));
  }

  @override
  Future<HttpResponse> put(String path, {
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request(HttpRequestParams(
      path: path,
      method: HttpRequestMethod.put,
      body: data,
      queryParams: queryParameters,
      headers: headers,
    ));
  }

  @override
  Future<HttpResponse> patch(String path, {
    required data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request(HttpRequestParams(
      path: path,
      method: HttpRequestMethod.patch,
      body: data,
      queryParams: queryParameters,
      headers: headers,
    ));
  }

  @override
  Future<HttpResponse> delete(String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request(HttpRequestParams(
      path: path,
      method: HttpRequestMethod.delete,
      queryParams: queryParameters,
      headers: headers,
    ));
  }

  @override
  void setHeaders(Map<String, dynamic> headers) {
    try {
      dio.options.headers.clear();
      dio.options.headers.addAll(headers);
    } catch (e) {
      throw SetHeadersException(message: e.toString());
    }
  }
}