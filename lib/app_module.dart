import 'package:clean_architecture/app_widget.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/presenter/search/search_store.dart';
import 'modules/search/presenter/search/user_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDataSource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchStore(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SearchPage()),
        ModularRouter('/user', child: (_, __) => UserPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
