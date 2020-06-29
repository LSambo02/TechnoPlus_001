import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';

class ZipInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ZipInput();
}

class _ZipInput extends State<ZipInput> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: TextFormField(
          autofocus: false,
          decoration: new InputDecoration(
              hintText: "ZIP CODE",
              icon: Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              )),
          validator: (value) => validateMyInput(value),
          onChanged: (value) => provider.setZip(value.trim()),
        ),
      );
    });
  }

  String validateMyInput(String value) {
    Pattern pattern = r'^[0-9]{4-6}$';
    RegExp regex = new RegExp(pattern);
    if ((value.length < 4 || value.length > 6) && !regex.hasMatch(value))
      return 'O ZIP CODE é obrigatório, ex: 1011';
    else
      return null;
  }
}
