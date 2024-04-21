import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_parking_management/app/modules/add_vacancy/presentation/bloc/add_vacancy_state.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../domain/domain.dart';
import 'add_vacancy_event.dart';

class AddVacancyBloc extends Bloc<AddVacancyEvent, AddVacancyState> {
  AddVacancyBloc({
    required this.getVacancyUseCase,
    required this.postVacancyUseCase,
  }) : super(InitialAddVacancyState()) {
    on<GetAddVacancyEvent>(getVacancy);
    on<RegisterVacancyEvent>(postAddVacancy);
  }

  final GetVacancyUseCase getVacancyUseCase;
  final PostVacancyUseCase postVacancyUseCase;

  Future<void> getVacancy(
    GetAddVacancyEvent event,
    Emitter<AddVacancyState> emit,
  ) async {
    emit(LoadingAddVacancyState());
    Either<NetworkExceptions, List<VacancyEntity>> response =
        await getVacancyUseCase.call();
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureAddVacancyState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessListVacancyState(data: r)),
    );
  }

  Future<void> postAddVacancy(
    RegisterVacancyEvent event,
    Emitter<AddVacancyState> emit,
  ) async {
    emit(LoadingAddVacancyState());
    Either<NetworkExceptions, RegisterVacancyEntity> response =
        await postVacancyUseCase.call(registerVacancyEntity: event.registerVacancyEntity);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureAddVacancyState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessAddVacancyState(data: r)),
    );
  }
}
