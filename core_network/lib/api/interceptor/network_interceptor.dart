import 'dart:ui';

import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {

  final Map<String, String> headersRequest;
  VoidCallback? doOnRequest;
  VoidCallback? doOnResponse;
  VoidCallback? doOnError;

  NetworkInterceptor({required this.headersRequest, this.doOnRequest, this.doOnResponse, this.doOnError});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    doOnError?.call();
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(headersRequest);
    doOnRequest?.call();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    doOnResponse?.call();
    super.onResponse(response, handler);
  }
}