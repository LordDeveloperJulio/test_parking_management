
import 'package:core_network/api/interceptor/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../api/network_client.dart';
import '../client/dio_network_client.dart';
import '../client/dio_network_interceptors.dart';
import '../constants/network_consts.dart';

void registerDependencies(
    bool isDebug, String baseUrl, List<NetworkInterceptor>? interceptors) {
  final GetIt getIt = GetIt.instance;

  getIt.registerSingleton(Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: NetworkConsts.connectTimeout,
      receiveTimeout: NetworkConsts.receiveTimeout,
      sendTimeout: NetworkConsts.sendTimeout)));

  getIt.registerLazySingleton<NetworkClient>(() {
    final dio = getIt.get<Dio>();
    if (interceptors != null && interceptors.isNotEmpty) registerInterceptor(interceptors);
    registerLogsInterceptor(isDebug);
    return DioNetworkClient(dio);
  });
}
