import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("teste"),
            ),
          ),
          FlatButton(
            child: Text("voltar"),
            onPressed: () => Modular.to.pushNamed('/'),
          )
        ],
      ),
    );
  }
}
