import 'package:core_network/core_network.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';
import 'presentation/add_vacancy_page.dart';
import 'presentation/bloc/add_vacancy_bloc.dart';

class AddVacancyModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    //BLOC
    i.add(
      () => AddVacancyBloc(
        getVacancyUseCase: Modular.get<GetVacancyUseCase>(),
        postVacancyUseCase: Modular.get<PostVacancyUseCase>(),
      ),
    );
    //USECASE
    i.add<GetVacancyUseCase>(
      () => GetVacancyUseCaseImpl(
          repository: Modular.get<GetListVacancyRepository>()),
    );
    i.add<PostVacancyUseCase>(
      () => PostVacancyUseCaseImpl(
          repository: Modular.get<AddVacancyRepository>()),
    );
    //REPOSITORY
    i.add<GetListVacancyRepository>(
      () => GetListVacancyRepositoryImpl(
          dataSource: Modular.get<GetListVacancyRemoteDataSource>()),
    );
    i.add<AddVacancyRepository>(
      () => AddVacancyRepositoryImpl(
          dataSource: Modular.get<AddVacancyRemoteDataSource>()),
    );
    //DATASOURCE
    i.add<GetListVacancyRemoteDataSource>(
      () => GetListVacancyRemoteDataSourceImpl(
          networkClient: CoreNetwork.instance),
    );
    i.add<AddVacancyRemoteDataSource>(
      () => AddVacancyRemoteDataSourceImpl(networkClient: CoreNetwork.instance),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AddVacancyPage());
  }
}
