import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class BiInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BiInput();
}

class _BiInput extends State<BiInput> {
  var maskTextInputFormatter = MaskedTextController(mask: "000000000-A");

  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
            autofocus: false,
            controller: maskTextInputFormatter,
            decoration: new InputDecoration(
                hintText: 'Bilhete de Identidade',
                icon: Icon(
                  Icons.perm_identity,
                  color: Colors.blueGrey,
                )),
            validator: (value) => validateMyInput(value),
            onChanged: (value) {
              value.replaceAll("-", "");
//              print(value);
              provider.setBi(value);
            }),
      );
    });
  }

  String validateMyInput(String value) {
    var left = 10, msg;
    if (value.length < 10) {
      left = left - value.length;
      msg = 'Por favor complete o número de BI, $left para completar';
    } else {
      msg = "[Padrão errado]";
    }
    Pattern pattern = r'^[0-9]{9}[-]{1}[A-Z]{1}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return msg;
    else
      return null;
  }
}
