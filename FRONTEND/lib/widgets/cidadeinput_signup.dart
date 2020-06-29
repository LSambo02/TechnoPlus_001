import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class CidadeInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CidadeInput();
}

class _CidadeInput extends State<CidadeInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
          autofocus: false,
          decoration: new InputDecoration(
              hintText: "Cidade",
              icon: Icon(
                Icons.location_city,
                color: Colors.blueGrey,
              )),
          validator: (value) =>
              value.isEmpty ? 'Por favor, insira o nome de sua cidade' : null,
          onChanged: (value) => provider.setCidade(value.trim()),
        ),
      );
    });
  }
}
