import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class GithubDataSource implements SearchDatasource {
  final Dio dio;

  GithubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio
        .get("https://api.github.com/search/users?q=${searchText.normalize()}");

    if (response.statusCode == 200) {
      final listResultSearchModel = (response.data['items'] as List)
          .map((e) => ResultSearchModel(
                nickname: e['login'],
                image: e['avatar_url'],
                url: e['url'],
              ))
          .toList();
      return listResultSearchModel;
    } else {
      throw DatasourceError();
    }
  }
}
