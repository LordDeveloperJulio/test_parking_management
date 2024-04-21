import 'package:core_network/api/network_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/detail_register/data/data.dart';
import 'package:test_parking_management/app/modules/detail_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/home/data/data.dart';
import 'package:test_parking_management/app/modules/home/infra/infra.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_event.dart';
import 'package:test_parking_management/app/modules/home/presentation/bloc/home_state.dart';
import 'package:bloc_test/bloc_test.dart';

/// repository
class MockGetAllRegistersRepository extends Mock
    implements GetAllRegistersRepository {}

class MockUpdateRegisterRepository extends Mock
    implements UpdateRegisterRepository {}

/// datasource
class MockGetAllRegistersRemoteDataSource extends Mock
    implements GetAllRegistersRemoteDataSource {}

class MockUpdateRegisterRemoteDataSource extends Mock
    implements UpdateRegisterRemoteDataSource {}

/// network
class MockNetworkClient extends Mock implements NetworkClient {}

/// cubit
class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}
