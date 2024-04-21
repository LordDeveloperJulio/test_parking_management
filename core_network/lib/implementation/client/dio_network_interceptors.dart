import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core_network.dart';

void registerInterceptor(List<NetworkInterceptor> interceptors) {
  final GetIt getIt = GetIt.instance;
  final dio = getIt.get<Dio>();
  dio.interceptors.addAll(interceptors);
}

void registerLogsInterceptor(bool isDebug) {
  final GetIt getIt = GetIt.instance;
  final dio = getIt.get<Dio>();

  final logInterceptor = LogInterceptor(
    request: isDebug,
    requestBody: isDebug,
    requestHeader: isDebug,
    responseBody: isDebug,
    responseHeader: isDebug,
  );

  dio.interceptors.add(logInterceptor);
}
