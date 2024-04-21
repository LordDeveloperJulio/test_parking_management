library core_network;

import 'package:get_it/get_it.dart';

import 'api/network_client.dart';
import 'implementation/di/di.dart';
import 'api/interceptor/network_interceptor.dart';
export 'implementation/exceptions/http_exceptions.dart';

export 'api/interceptor/network_interceptor.dart';

abstract class CoreNetwork {
  static final _instance = GetIt.instance.get<NetworkClient>();
  static NetworkClient get instance => _instance;

  static Future<void> init(
      {required bool isDebug,
      required String baseUrl,
      List<NetworkInterceptor>? interceptors}) async {
    registerDependencies(isDebug, baseUrl, interceptors);
  }
}
