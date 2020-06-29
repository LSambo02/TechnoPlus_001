import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';
import 'package:technoplus_CRUD/models/Email.dart';

class EmailInput extends StatefulWidget {
  var email;

  EmailInput(this.email);

  @override
  State<StatefulWidget> createState() => _EmailInput(this.email);
}

class _EmailInput extends State<EmailInput> {
  var email;

  _EmailInput(this.email);

  var dropDownValue = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClienteProvider>(builder: (context, provider, child) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Container(
              alignment: Alignment.center,
              width: 250,
              child: Center(
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      hintText: "Endereço elctrónico",
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.blueGrey,
                      )),
                  validator: (value) => validateEmail(value),
                  onSaved: (value) {
                    Email email = new Email(value.trim());
                    provider.updateEmailList(email);
                  },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\'
        r'[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
        r')+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Por favor, insira um email válido';
    else
      return null;
  }
}
