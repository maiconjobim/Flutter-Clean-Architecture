import 'package:clean_architecture/app_widget.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDataSource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}

class Router {}
