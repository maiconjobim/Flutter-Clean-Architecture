import 'package:clean_architecture/modules/search/presenter/search/search_store.dart';
import 'package:clean_architecture/modules/search/presenter/search/states/search_state.dart';
import 'package:clean_architecture/modules/search/presenter/search/widgets/build_error.dart';
import 'package:clean_architecture/modules/search/presenter/search/widgets/build_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: controller.setSearchText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquise...",
              ),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              var state = controller.state;

              if (state is ErrorState) {
                return BuildError(
                  error: state.error,
                );
              }

              if (state is StartState) {
                return Center(
                  child: Text('Digita alguma coisa...'),
                );
              } else if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                return BuildList(
                  list: state.list,
                );
              } else {
                return Container();
              }
            }),
          )
        ],
      ),
    );
  }
}
