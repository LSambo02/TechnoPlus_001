import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class LogradouroInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogradouroInput();
}

class _LogradouroInput extends State<LogradouroInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
          autofocus: false,
          decoration: new InputDecoration(
              hintText: "Logradouro",
              icon: Icon(
                Icons.place,
                color: Colors.blueGrey,
              )),
          validator: (value) =>
              value.isEmpty ? 'Por favor insira sua rua' : null,
          onChanged: (value) => provider.setLogradouro(value.trim()),
        ),
      );
    });
  }
}
