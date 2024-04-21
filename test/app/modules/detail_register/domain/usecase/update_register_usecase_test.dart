import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/detail_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/shared/domain/entities/entities.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final MockUpdateRegisterRepository repository;
  late final UpdateRegisterUseCase usecase;

  setUpAll(() {
    repository = MockUpdateRegisterRepository();
    usecase = UpdateRegisterUseCaseImpl(repository: repository);
  });

  test(
      'should return a RegistersEntity when the updateRegister method is called',
      () async {
    when(() => repository.updateRegister(
          registerVacancyEntity: Resources.mockUpdateRegister,
        )).thenAnswer(
      (_) async => Right(
        Resources.mockUpdateRegister,
      ),
    );

    final response = await usecase.call(
      registerVacancyEntity: Resources.mockUpdateRegister,
    );

    expect(response, isA<Right<NetworkExceptions, RegistersEntity>>());
  });

  test(
      'should return a NetworkBadRequestException when the updateRegister method is called',
      () async {
    when(() => repository.updateRegister(
          registerVacancyEntity: Resources.mockUpdateRegister,
        )).thenAnswer(
      (_) async => Left((NetworkBadRequestException())),
    );
    final response = await usecase.call(
      registerVacancyEntity: Resources.mockUpdateRegister,
    );
    expect(response, isA<Left<NetworkExceptions, RegistersEntity>>());
  });
}
