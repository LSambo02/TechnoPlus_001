import 'package:flutter/material.dart';
import 'package:technoplus_CRUD/widgets/primaryButton.dart';

import '../widgets/loadingIndicator.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  var user, senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey,
              ),
            ],
          ),
          Center(
              child: Card(
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(42),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Center(
                          child: Container(
                              margin: EdgeInsets.all(30),
                              child: Text(
                                "Seja Bem-Vindo",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                    color: Colors.blueGrey),
                              ))),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Por favor, insira seu nome!",
                            icon: Icon(
                              Icons.mail,
                              color: Colors.blueGrey,
                            )),
                        onChanged: (value) => user = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Por favor, insira sua senha!",
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blueGrey,
                            )),
                        obscureText: true,
                        onChanged: (value) => senha = value,
                      ),
                      isLoading
                          ? LoadingIndicator()
                          : PrimaryButton("Entrar", _validateAndSubmit),
//                      SecondaryButton("Criar uma Conta", "/"),
//                      _forgetButton()
                    ],
                  )),
            ),
          )),
        ],
      ),
    );
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('icon/icon.png'),
        ),
      ),
    );
  }

  Widget _forgetButton() {
    return new FlatButton(
      child: new Text('Esqueceu password? ',
          style: new TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w300,
              color: Colors.blueGrey)),
      onPressed: () {
        setState(() {
          _formKey.currentState.save();
//          if (!email.isEmpty) {
////            resetPassword(email);
//            return ShowAlertDialog().showAlertDialog(
//                context,
//                'Verifique seu email',
//                'Mandamos-lhe um email para reiniciar sua password \n Certifique-se de introduzir \n uma password que difere da anterior');
//          } else {
//            return ShowAlertDialog().showAlertDialog(
//                context,
//                'Verifique seu email e Password',
//                'Insira pelo um email válido');
//          }
        });
      },
    );
  }

  _validateAndSubmit() {
    if ((user == "admin" || user == "comum") && senha == "123456") {
      Navigator.of(context)
          .pushNamed("/home", arguments: {'user': user, 'senha': senha});
    }
  }
}
