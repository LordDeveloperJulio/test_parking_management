import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/data/data.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final GetListVacancyRemoteDataSource dataSource;
  late final NetworkClient client;

  setUpAll(() {
    client = MockNetworkClient();
    dataSource = GetListVacancyRemoteDataSourceImpl(networkClient: client);
  });

  test('method get should return a List<dynamic>', () async {
    when(
      () => client.get(
        any(),
      ),
    ).thenAnswer((_) async => Resources.mockListVacancyHttpResponse);

    final response = await dataSource.getVacancy();
    expect(response, isA<Right<HttpExceptions, List<dynamic>>>());
  });

  test('method get should return a throw exception', () async {
    when(
      () => client.get(
        any(),
      ),
    ).thenThrow(
      HttpGeneralException(statusCode: 406, data: null),
    );

    final response = await dataSource.getVacancy();

    expect(response, isA<Left<HttpExceptions, List<dynamic>>>());
  });
}
