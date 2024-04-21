import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/detail_register/data/data.dart';
import 'package:test_parking_management/app/modules/detail_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/shared/domain/entities/entities.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final UpdateRegisterRepository repository;
  late final UpdateRegisterRemoteDataSource dataSource;

  setUpAll(() {
    dataSource = MockUpdateRegisterRemoteDataSource();
    repository = UpdateRegisterRepositoryImpl(dataSource: dataSource);
  });

  test('when the updateRegister method is called RegistersEntity', () async {
    when(
      () => dataSource.updateRegister(
        registerVacancyEntity: Resources.mockUpdateRegister,
      ),
    ).thenAnswer(
      (_) async => Right(
        Resources.mockUpdateRegisterHttpResponseData,
      ),
    );

    final response = await repository.updateRegister(
      registerVacancyEntity: Resources.mockUpdateRegister,
    );

    expect(response, isA<Right<NetworkExceptions, RegistersEntity>>());
  });

  test('should return an exception when the updateRegister method is called',
      () async {
    when(
      () => dataSource.updateRegister(
        registerVacancyEntity: Resources.mockUpdateRegister,
      ),
    ).thenAnswer(
      (_) async => Left(
        HttpGeneralException(statusCode: null, data: {}),
      ),
    );
    final response = await repository.updateRegister(
      registerVacancyEntity: Resources.mockUpdateRegister,
    );
    expect(response, isA<Left<NetworkExceptions, RegistersEntity>>());
  });
}
