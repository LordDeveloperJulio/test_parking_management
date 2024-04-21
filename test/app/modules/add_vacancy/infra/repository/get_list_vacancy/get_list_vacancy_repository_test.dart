import 'package:core_network/core_network.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/data/data.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/add_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final GetListVacancyRepository repository;
  late final GetListVacancyRemoteDataSource dataSource;

  setUpAll(() {
    dataSource = MockGetListVacancyRemoteDataSource();
    repository = GetListVacancyRepositoryImpl(dataSource: dataSource);
  });

  test(
      'when the getAllRegisters method is called return a list of VacancyEntity',
      () async {
    when(
      () => dataSource.getVacancy(),
    ).thenAnswer(
      (_) async => Right(
        Resources.mockListVacancyHttpResponseData,
      ),
    );

    final response = await repository.getVacancy();

    expect(response, isA<Right<NetworkExceptions, List<VacancyEntity>>>());
  });

  test(
      'should return an exception when the getVacancy method is called',
      () async {
    when(
      () => dataSource.getVacancy(),
    ).thenAnswer(
      (_) async => Left(
        HttpGeneralException(
          statusCode: 400,
          data: null,
        ),
      ),
    );
    final response = await repository.getVacancy();
    expect(response, isA<Left<NetworkExceptions, List<VacancyEntity>>>());
  });
}
