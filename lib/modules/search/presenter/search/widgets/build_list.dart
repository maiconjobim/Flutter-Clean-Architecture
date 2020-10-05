import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuildList extends StatelessWidget {
  final List<ResultSearch> list;

  const BuildList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          onTap: () => Modular.to.popAndPushNamed('/user'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.image),
          ),
          title: Text(item.nickname),
        );
      },
    );
  }
}
