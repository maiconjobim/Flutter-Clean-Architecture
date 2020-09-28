import 'dart:convert';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_result.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  final datasource = GithubDataSource(dioMock);
  test("Deve retornar uma lista de ResultSearchModel", () async {
    when(dioMock.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));
    final future = datasource.getSearch("searchText");

    expect(future, completes);
  });

  test("Deve retornar um DatasourceError se o statusCode não for 200",
      () async {
    when(dioMock.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = datasource.getSearch("searchText");

    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Deve retornar uma Exception se o Dio der erro", () async {
    when(dioMock.get(any)).thenThrow(Exception());
    final future = datasource.getSearch("searchText");

    expect(future, throwsA(isA<Exception>()));
  });
}
