import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/shared/domain/entities/entities.dart';
import 'package:core_network/api/models/http_response.dart';

class Resources {
  static final mockHomeHttpResponse = HttpResponse(
    statusCode: 200,
    data: mockGetAllRegistersHttpResponseData,
  );

  static List<dynamic> mockGetAllRegistersHttpResponseData = [
    {
      "id": 6,
      "driverName": "Moises Martins Silva",
      "plate": "RZA9H58",
      "vacancyId": 1,
      "dateEntry": "20/04/2024",
      "dateExit": "21/04/2024",
    },
    {
      "id": 7,
      "driverName": "Julio Gabriel",
      "plate": "RZA9H58",
      "vacancyId": 2,
      "dateEntry": "20/04/2024",
      "dateExit": "21/04/2024"
    },
    {
      "id": 8,
      "driverName": "Julio",
      "plate": "NAX3IOa",
      "vacancyId": 1,
      "dateEntry": "2024-04-21 00:00:08.573969",
      "dateExit": ""
    }
  ];

  static final mockGetAllRegisters = <RegistersEntity>[
    RegistersEntity(
      id: 1,
      driverName: 'João',
      plate: 'NAX8U00',
      vacancyId: 1,
      dateEntry: '21/04/2024',
      dateExit: '',
    ),
    RegistersEntity(
      id: 2,
      driverName: 'José',
      plate: 'NAX8U22',
      vacancyId: 2,
      dateEntry: '21/04/2024',
      dateExit: '21/04/2024',
    ),
  ];

  static final mockUpdateRegister = RegistersEntity(
    id: 1,
    driverName: 'João',
    plate: 'NAX8U00',
    vacancyId: 1,
    dateEntry: '21/04/2024',
    dateExit: '21/04/2024',
  );

  static final mockAddRegister = AddRegisterEntity(
    driverName: 'João',
    plate: 'NAX8U00',
    vacancyId: 1,
    dateEntry: '21/04/2024',
    dateExit: '21/04/2024',
  );

  static final mockUpdateRegisterHttpResponse = HttpResponse(
    statusCode: 200,
    data: mockUpdateRegisterHttpResponseData,
  );

  static final mockUpdateRegisterHttpResponseData = {
    "id": 6,
    "driverName": "Jose Cesar",
    "plate": "RZA9H58",
    "vacancyId": 1,
    "dateEntry": "20/04/2024",
    "dateExit": "21/04/2024",
  };

  static final mockAddRegisterHttpResponse = HttpResponse(
    statusCode: 200,
    data: mockUpdateRegisterHttpResponseData,
  );

  static final mockAddRegisterHttpResponseData = {
    "driverName": "Jose Cesar",
    "plate": "RZA9H58",
    "vacancyId": 1,
    "dateEntry": "20/04/2024",
    "dateExit": "21/04/2024",
  };

  static final mockListVacancyHttpResponse = HttpResponse(
    statusCode: 200,
    data: mockListVacancyHttpResponseData,
  );

  static List<dynamic> mockListVacancyHttpResponseData = [
    {"id": 12, "number": 12, "statusVaga": "DISPONIVEL"},
    {"id": 8, "number": 8, "statusVaga": "DISPONIVEL"},
    {"id": 6, "number": 6, "statusVaga": "DISPONIVEL"},
    {"id": 5, "number": 5, "statusVaga": "DISPONIVEL"},
    {"id": 4, "number": 4, "statusVaga": "DISPONIVEL"},
    {"id": 13, "number": 13, "statusVaga": "DISPONIVEL"},
    {"id": 11, "number": 11, "statusVaga": "DISPONIVEL"},
    {"id": 7, "number": 7, "statusVaga": "DISPONIVEL"},
    {"id": 9, "number": 9, "statusVaga": "DISPONIVEL"},
    {"id": 14, "number": 14, "statusVaga": "DISPONIVEL"},
    {"id": 1, "number": 1, "statusVaga": "DISPONIVEL"},
    {"id": 10, "number": 10, "statusVaga": "DISPONIVEL"},
    {"id": 2, "number": 2, "statusVaga": "DISPONIVEL"},
    {"id": 3, "number": 3, "statusVaga": "DISPONIVEL"}
  ];

  static final mockGetVacancy = <VacancyEntity>[
    VacancyEntity(
      id: 1,
      number: 1,
      statusVaga: 'DISPONIVEL',
    ),
    VacancyEntity(
      id: 2,
      number: 2,
      statusVaga: 'DISPONIVEL',
    ),
  ];
}
