import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';
import 'package:technoplus_CRUD/models/Telefone.dart';

class TelefoneInput extends StatefulWidget {
  var tel;

  TelefoneInput(this.tel);

  @override
  State<StatefulWidget> createState() => _TelefoneInput(this.tel);
}

class _TelefoneInput extends State<TelefoneInput> {
  var tel;
  var dropDownValue = 1;
  var maskTextInputFormatter = MaskedTextController(mask: "+55 00 0000-0000");
  var maskTextInputFormatter1 = MaskedTextController(mask: "+55 00 00000-0000");

  _TelefoneInput(this.tel);

  @override
  Widget build(BuildContext context) {
    return telefoneInput(tel);
  }

  Widget telefoneInput(tel) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Row(
        children: [
          DropdownButton(
            items: dropdownItems,
            value: dropDownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),
            onChanged: (value) {
              setState(() {
                dropDownValue = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Container(
              width: 250,
              child: TextFormField(
                autofocus: false,
                controller: dropDownValue == 3
                    ? maskTextInputFormatter1
                    : maskTextInputFormatter,
                decoration: new InputDecoration(
                    hintText: "Número de telefone",
                    icon: Icon(
                      Icons.settings_cell,
                      color: Colors.blueGrey,
                    )),
                validator: (value) =>
                    value.length < (dropDownValue == 3 ? 17 : 16)
                        ? 'Por favor, insira um número de telefone válido'
                        : null,
                onSaved: (value) {
                  value.replaceAll(" ", "");
                  value.replaceAll("-", "");
                  Telefone telefone = new Telefone(value, dropDownValue);
                  provider.updateTelList(telefone);
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  List<DropdownMenuItem<dynamic>> dropdownItems = [
    DropdownMenuItem(
      child: Text("Residencial"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("Comercial"),
      value: 2,
    ),
    DropdownMenuItem(child: Text("Celular"), value: 3)
  ].toList();
}
