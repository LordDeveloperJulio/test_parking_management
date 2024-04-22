import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';

mixin HomePageMixin {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();

  String titlePage = "Entradas/Dia";

  changeTitle(String value) {
    switch (value) {
      case "dateEntry":
        titlePage = "Entradas/Dia";
        break;
      case "dateExit":
        titlePage = "Saídas/Dia";
        break;
      case "":
        titlePage = "Entradas e Saídas/Dia";
        break;
    }
  }
}
