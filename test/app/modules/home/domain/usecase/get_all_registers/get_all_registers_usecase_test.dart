import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/home/domain/domain.dart';
import 'package:test_parking_management/app/modules/shared/domain/entities/entities.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../../mock/mocks.dart';
import '../../../../../../resources.dart';

void main() {
  late final MockGetAllRegistersRepository repository;
  late final GetAllRegistersUseCase usecase;

  setUpAll(() {
    repository = MockGetAllRegistersRepository();
    usecase = GetAllRegistersUseCaseImpl(repository: repository);
  });

  test(
      'when the getAllRegisters method is called with the dateEntry parameter it must return a list of RegistersEntity',
      () async {
    when(() => repository.getAllRegisters(param: 'dateEntry')).thenAnswer(
      (_) async => Right(Resources.mockGetAllRegisters),
    );

    final response = await usecase.call(param: 'dateEntry');

    expect(response, isA<Right<NetworkExceptions, List<RegistersEntity>>>());
  });

  test('should return an exception when the getAllRegisters method with the dateEntry parameter is called', () async {
    when(() => repository.getAllRegisters(param: 'dateEntry')).thenAnswer(
      (_) async => Left(NetworkBadRequestException()),
    );
    final response = await usecase.call(param: 'dateEntry');
    expect(response, isA<Left<NetworkExceptions, List<RegistersEntity>>>());
  });
}
