import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter/material.dart';

class BuildError extends StatelessWidget {
  final ErrorSearch error;

  const BuildError({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Erro no github'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }
}
