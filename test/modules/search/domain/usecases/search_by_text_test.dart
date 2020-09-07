import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => Right(<ResultSearch>[]));

    final result = await usecase("maicon");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um InvalidTextError caso texto seja invalido ', () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());
  });
}
