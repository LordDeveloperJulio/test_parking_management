import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';
import 'constants/strings_constants.dart';

mixin HomePageMixin {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();

  String titlePage = StringConstants.inputDay;

  changeTitle(String value) {
    switch (value) {
      case StringConstants.dateEntry:
        titlePage = StringConstants.inputDay;
        break;
      case StringConstants.dateExit:
        titlePage = StringConstants.outputDay;
        break;
      case StringConstants.empty:
        titlePage = StringConstants.inputOutput;
        break;
    }
  }
}
