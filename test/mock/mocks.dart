import 'package:core_network/api/network_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_parking_management/app/modules/add_register/data/data.dart';
import 'package:test_parking_management/app/modules/add_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/detail_register/data/data.dart';
import 'package:test_parking_management/app/modules/detail_register/infra/infra.dart';
import 'package:test_parking_management/app/modules/home/data/data.dart';
import 'package:test_parking_management/app/modules/home/infra/infra.dart';

/// repository
class MockGetAllRegistersRepository extends Mock
    implements GetAllRegistersRepository {}

class MockUpdateRegisterRepository extends Mock
    implements UpdateRegisterRepository {}

class MockAddRegisterRepository extends Mock
    implements AddRegisterRepository {}

class MockGetListVacancyRepository extends Mock
    implements GetListVacancyRepository {}

/// datasource
class MockGetAllRegistersRemoteDataSource extends Mock
    implements GetAllRegistersRemoteDataSource {}

class MockUpdateRegisterRemoteDataSource extends Mock
    implements UpdateRegisterRemoteDataSource {}

class MockAddRegisterRemoteDataSource extends Mock
    implements AddRegisterRemoteDataSource {}

class MockGetListVacancyRemoteDataSource extends Mock
    implements GetListVacancyRemoteDataSource {}

/// network
class MockNetworkClient extends Mock implements NetworkClient {}