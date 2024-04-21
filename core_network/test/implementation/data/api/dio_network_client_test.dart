import 'package:core_network/api/enums/http_request_method.dart';
import 'package:core_network/api/network_client.dart';
import 'package:core_network/implementation/client/dio_network_client.dart';
import 'package:core_network/api/models/http_request_params.dart';
import 'package:core_network/api/models/http_response.dart';
import 'package:core_network/implementation/exceptions/exceptions.dart';
import 'package:core_network/implementation/exceptions/http_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late NetworkClient sut;
  late Dio mockDio;

  setUp(() {
    mockDio = MockDio();
    sut = DioNetworkClient(mockDio);
  });

  group('Given a DioNetworkClient,', () {
    group("when sending a GET request,", () {
      test(
          "then it should return a HttpResponse with status code 200 when parameters are valid",
          () async {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/api/users'),
              data: {'key': 'value'},
              statusCode: 200,
            ));

        final response = await sut.request(HttpRequestParams(
          path: '/api/users',
          method: HttpRequestMethod.get,
        ));

        expect(response, isA<HttpResponse>());
        expect(response.statusCode, 200);
      });

      test(
          "then it should return an HttpGeneralException when parameters are invalid",
          () {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenThrow(DioException(
          requestOptions: RequestOptions(path: 'shdfgewuyrt387r32476r8'),
          type: DioExceptionType.unknown,
        ));

        final response = sut.request(HttpRequestParams(
          path: 'shdfgewuyrt387r32476r8',
          method: HttpRequestMethod.get,
        ));

        expect(() async => response, throwsA(isA<HttpGeneralException>()));
      });
    });

    group("when sending a POST request,", () {
      test(
          'then it should return a HttpResponse with status code 200 when parameters are valid',
          () async {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/api/users'),
              data: {'key': 'value'},
              statusCode: 201,
            ));

        final response = await sut.request(HttpRequestParams(
          path: '/api/users',
          method: HttpRequestMethod.post,
          body: {'key': 'value'},
        ));

        expect(response, isA<HttpResponse>());
        expect(response.statusCode, 201);
      });

      test(
          'then it should return an HttpGeneralException when parameters are invalid',
          () {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenThrow(DioException(
          requestOptions: RequestOptions(path: 'shdfgewuyrt387r32476r8'),
          type: DioExceptionType.unknown,
        ));

        final response = sut.request(HttpRequestParams(
          path: 'shdfgewuyrt387r32476r8',
          method: HttpRequestMethod.post,
          body: null,
        ));

        expect(
            () async => await response, throwsA(isA<HttpGeneralException>()));
      });
    });

    group("when sending a PUT request", () {
      test(
          'then it should return a HttpResponse with status code 200 when parameters are valid',
          () async {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/api/users/2'),
              data: {'key': 'value2'},
              statusCode: 200,
            ));

        final response = await sut.request(HttpRequestParams(
          path: '/api/users/2',
          method: HttpRequestMethod.put,
          body: {'key': 'value2'},
        ));

        expect(response, isA<HttpResponse>());
        expect(response.statusCode, 200);
      });

      test(
          'then it should return an HttpGeneralException when parameters are invalid',
          () {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenThrow(DioException(
          requestOptions: RequestOptions(path: 'shdfgewuyrt387r32476r8'),
          type: DioExceptionType.unknown,
        ));

        final response = sut.request(HttpRequestParams(
          path: 'shdfgewuyrt387r32476r8',
          method: HttpRequestMethod.put,
          body: {'key': 'value'},
        ));

        expect(() => response, throwsA(isA<HttpGeneralException>()));
      });
    });

    group("when sending a PATCH request", () {
      test(
          'then it should return a HttpResponse with status code 200 when parameters are valid',
          () async {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/api/users/2'),
              data: {'key': 'value2'},
              statusCode: 200,
            ));

        final response = await sut.request(HttpRequestParams(
          path: '/api/users/2',
          method: HttpRequestMethod.patch,
          body: {'key': 'value2'},
        ));

        expect(response, isA<HttpResponse>());
        expect(response.statusCode, 200);
      });

      test(
          'then it should return an HttpGeneralException when parameters are invalid',
          () {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenThrow(DioException(
          requestOptions: RequestOptions(path: 'shdfgewuyrt387r32476r8'),
          type: DioExceptionType.unknown,
        ));

        final response = sut.request(HttpRequestParams(
          path: 'shdfgewuyrt387r32476r8',
          method: HttpRequestMethod.patch,
          body: {'key': 'value'},
        ));

        expect(() => response, throwsA(isA<HttpGeneralException>()));
      });
    });

    group("when sending a DELETE request", () {
      test(
          'then it should return a HttpResponse with status code 200 when parameters are valid',
          () async {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/api/users/2'),
              data: {'key': 'value2'},
              statusCode: 204,
            ));
        final response = await sut.request(HttpRequestParams(
          path: '/api/users/2',
          method: HttpRequestMethod.delete,
          body: {'key': 'value2'},
        ));

        expect(response, isA<HttpResponse>());
        expect(response.statusCode, 204);
      });

      test(
          'then it should return an HttpGeneralException when parameters are invalid',
          () {
        when(() => mockDio.request(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              options: any(named: 'options'),
            )).thenThrow(DioException(
          requestOptions: RequestOptions(path: 'shdfgewuyrt387r32476r8'),
          type: DioExceptionType.unknown,
        ));

        final response = sut.request(HttpRequestParams(
          path: 'shdfgewuyrt387r32476r8',
          method: HttpRequestMethod.delete,
          body: {'key': 'value'},
        ));

        expect(() => response, throwsA(isA<HttpGeneralException>()));
      });
    });

    group("when setting headers,", () {
      test("then it should call Dio Options", () {
        when(() => mockDio.options).thenReturn(BaseOptions(headers: {'key': 'value'}));

        sut.setHeaders({'key': 'value'});

        verify(() => mockDio.options).called(2);
      });

      test("then it should throw SetHeadersException when headers are empty", () {
        when(() => mockDio.options.headers.addAll(any())).thenThrow(SetHeadersException());

        expect(() => sut.setHeaders({}), throwsA(isA<SetHeadersException>()));
      });
    });
  });
}
