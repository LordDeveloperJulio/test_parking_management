import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/detail_register_bloc.dart';

mixin DetailRegisterPageMixin {
  final DetailRegisterBloc detalRegisterBloc = Modular.get<DetailRegisterBloc>();
}