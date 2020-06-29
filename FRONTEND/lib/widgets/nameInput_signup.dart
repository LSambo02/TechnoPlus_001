import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class UsernameInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsernameInput();
}

class _UsernameInput extends State<UsernameInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
          obscureText: false,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: "Nome de utilizador",
              icon: Icon(
                Icons.account_circle,
                color: Colors.blueGrey,
              )),
          validator: (value) => validateMyInput(value),
          onChanged: (value) => provider.setUsername(value.trim()),
        ),
      );
    });
  }

  String validateMyInput(String value) {
    Pattern pattern = r'^[a-zA-Z0-9 ]+$';
    RegExp regex = new RegExp(pattern);
    if ((value.length < 3 || value.length > 100) || !regex.hasMatch(value))
      return 'Nome de utilizador deve ter entre 3 e 100 caracteres';
    else
      return null;
  }
}
