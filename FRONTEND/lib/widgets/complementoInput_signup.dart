import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class ComplementoInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ComplementoInput();
}

class _ComplementoInput extends State<ComplementoInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
            obscureText: true,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: "Complemento",
                icon: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                )),
            onChanged: (value) {
              if (value.isEmpty) {
                provider.setcomplemento("");
              } else {
                provider.setcomplemento(value.trim());
              }
            }),
      );
    });
  }
}
