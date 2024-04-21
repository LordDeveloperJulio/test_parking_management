import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/domain/entities/entities.dart';
import '../../../shared/exceptions/exceptions.dart';
import '../../domain/domain.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getListVacancyUseCase}) : super(InitialHomeState()) {
    on<GetHomeListVacancyEvent>(getAllRegisters);
  }

  final GetAllRegistersUseCase getListVacancyUseCase;

  Future<void> getAllRegisters(
      GetHomeListVacancyEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingGetAllRegistersState());
    Either<NetworkExceptions, List<RegistersEntity>> response =
        await getListVacancyUseCase.call(param: event.param);
    response.fold(
      (NetworkExceptions networkExceptions) => emit(FailureHomeState(
        error: networkExceptions.message!,
      )),
      (r) => emit(SuccessGetAllRegistersState(data: r)),
    );
  }
}
