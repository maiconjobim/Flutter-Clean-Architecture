import 'dart:convert';

import 'package:clean_architecture/app_module.dart';
import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/search/utils/github_result.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [Bind<Dio>((i) => dio)]);

  test("Deve retornart o useCase sem erro", () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test("Deve trazer uma lista de ResultSearch", () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("maicon");

    expect(result | null, isA<List<ResultSearch>>());
  });
}
