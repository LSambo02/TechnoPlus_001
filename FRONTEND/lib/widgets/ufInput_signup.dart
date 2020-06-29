import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class UfInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UfInput();
}

class _UfInput extends State<UfInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
//      obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: "Unidade federativa",
              icon: Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              )),
          validator: (value) => value.isEmpty || value == ""
              ? 'Por favor, insira a unidade federativa'
              : null,
          onChanged: (value) => provider.setUf(value.trim()),
        ),
      );
    });
  }
}
