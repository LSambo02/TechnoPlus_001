import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class PasswordInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordInput();
}

class _PasswordInput extends State<PasswordInput> {
  var pass, pass1;
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: TextFormField(
              obscureText: true,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock_outline,
                    color: Colors.blueGrey,
                  )),
              validator: (value) => value.length < 6
                  ? 'Password deve conter no mínimo 6 caracteres'
                  : null,
              onSaved: (value) => pass = value.trim(),
              onChanged: (value) => pass = value,
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: TextFormField(
              //controller: tFcontroller1,
              obscureText: true,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: 'Confirme a password',
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blueGrey,
                  )),
              validator: (value) => value.isEmpty || value != pass
                  ? 'A password deve ser igual'
                  : null,
              onChanged: (value) => provider.setPassword(value.trim()),
            ),
          ),
        ],
      );
    });
  }
}
