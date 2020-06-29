import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class BairroInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BairroInput();
}

class _BairroInput extends State<BairroInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
            autofocus: false,
            decoration: new InputDecoration(
                hintText: "Bairro",
                icon: Icon(
                  Icons.location_on,
                  color: Colors.blueGrey,
                )),
            validator: (value) =>
                value.isEmpty ? 'Por favor, insira o nome de seu bairro' : null,
            onChanged: (value) {
              print("VALUE: " + value);
              provider.setBairro(value.trim());
            }),
      );
    });
  }
}
