import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/home/domain/domain.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_event.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_state.dart';
import 'package:test_parking_management/app/modules/shared/exceptions/exceptions.dart';

import '../../../../../mock/mocks.dart';
import '../../../../../resources.dart';

void main() {
  late final MockGetAllRegistersRepository repository;
  late final GetAllRegistersUseCase getListVacancyUseCase;

  setUpAll(() {
    repository = MockGetAllRegistersRepository();
    getListVacancyUseCase = GetAllRegistersUseCaseImpl(repository: repository);
  });

  blocTest<HomeBloc, HomeState>(
    'emits SuccessGetAllRegistersState when getAllRegisters method is called',
    setUp: () {
      when(() => repository.getAllRegisters(param: 'dateEntry'))
          .thenAnswer((_) async => Right(Resources.mockGetAllRegisters));
    },
    build: () => HomeBloc(getListVacancyUseCase: getListVacancyUseCase),
    act: (bloc) {
      bloc.add(GetHomeListVacancyEvent(param: 'dateEntry'));
    },
    expect: () => [
      isA<LoadingGetAllRegistersState>(),
      isA<SuccessGetAllRegistersState>(),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits FailureHomeState when getAllRegisters method is called',
    setUp: () {
      when(() => repository.getAllRegisters(param: 'dateEntry'))
          .thenAnswer((_) async => Left(NetworkBadRequestException()));
    },
    build: () => HomeBloc(getListVacancyUseCase: getListVacancyUseCase),
    act: (bloc) {
      bloc.add(GetHomeListVacancyEvent(param: 'dateEntry'));
    },
    expect: () => [
      isA<LoadingGetAllRegistersState>(),
      isA<FailureHomeState>(),
    ],
  );
}
