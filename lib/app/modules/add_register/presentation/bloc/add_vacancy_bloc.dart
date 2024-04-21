import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/exceptions/exceptions.dart';
import '../../domain/domain.dart';
import 'add_vacancy_event.dart';
import 'add_vacancy_state.dart';

class AddRegisterBloc extends Bloc<AddRegisterEvent, AddRegisterState> {
  AddRegisterBloc({
    required this.getVacancyUseCase,
    required this.addRegisterUseCase,
  }) : super(InitialAddRegisterState()) {
    on<GetAddRegisterEvent>(getVacancy);
    on<RegisterVacancyEvent>(postAddRegister);
  }

  final GetVacancyUseCase getVacancyUseCase;
  final AddRegisterUseCase addRegisterUseCase;

  Future<void> getVacancy(
    GetAddRegisterEvent event,
    Emitter<AddRegisterState> emit,
  ) async {
    emit(LoadingAddRegisterState());
    Either<NetworkExceptions, List<VacancyEntity>> response =
        await getVacancyUseCase.call();
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureAddRegisterState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessListVacancyState(data: r)),
    );
  }

  Future<void> postAddRegister(
    RegisterVacancyEvent event,
    Emitter<AddRegisterState> emit,
  ) async {
    emit(LoadingAddRegisterState());
    Either<NetworkExceptions, AddRegisterEntity> response =
        await addRegisterUseCase.call(registerVacancyEntity: event.registerVacancyEntity);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureAddRegisterState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessAddRegisterState(data: r)),
    );
  }
}
