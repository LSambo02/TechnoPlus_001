import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoplus_CRUD/controllers/ClienteController.dart';
import 'package:technoplus_CRUD/managers/ClienteProvider.dart';
import 'package:technoplus_CRUD/models/Cliente.dart';
import 'package:technoplus_CRUD/models/Email.dart';
import 'package:technoplus_CRUD/models/Telefone.dart';
import 'package:technoplus_CRUD/widgets/bairroInput_signup.dart';
import 'package:technoplus_CRUD/widgets/biInput_signup.dart';
import 'package:technoplus_CRUD/widgets/cidadeinput_signup.dart';
import 'package:technoplus_CRUD/widgets/complementoInput_signup.dart';
import 'package:technoplus_CRUD/widgets/confirmPass_signup.dart';
import 'package:technoplus_CRUD/widgets/emailInput_signup.dart';
import 'package:technoplus_CRUD/widgets/logradouro_signup.dart';
import 'package:technoplus_CRUD/widgets/nameInput_signup.dart';
import 'package:technoplus_CRUD/widgets/telefoneInput_signup.dart';
import 'package:technoplus_CRUD/widgets/ufInput_signup.dart';
import 'package:technoplus_CRUD/widgets/zipInput_signup.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  final _formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  String bi,
      nome,
      apelido,
      pass,
      pass1,
      email,
      username,
      zip,
      logradouro,
      bairro,
      cidade,
      uf,
      complemento,
      telefone,
      numero;
  int currStep = 0;
  List<Widget> telefones_campos = [];
  List<Widget> email_campos = [];
  List<Email> eamils = [];
  List<Telefone> telefones = [];

  TelefoneInput telefoneInput;
  EmailInput emailInput;
  BairroInput bairroInput;
  BiInput biInput;
  CidadeInput cidadeInput;
  ComplementoInput complementoInput;
  PasswordInput passwordInput;
  UsernameInput usernameInput;
  LogradouroInput logradouroInput;
  UfInput ufInput;
  ZipInput zipInput;
  Telefones listTelefones;
  Emails listEmails;

  @override
  void initState() {
    telefoneInput = new TelefoneInput(numero);
    emailInput = new EmailInput(email);
    bairroInput = new BairroInput();
    biInput = new BiInput();
    cidadeInput = new CidadeInput();
    complementoInput = new ComplementoInput();
    passwordInput = new PasswordInput();
    usernameInput = new UsernameInput();
    logradouroInput = new LogradouroInput();
    ufInput = new UfInput();
    zipInput = new ZipInput();

    telefones_campos.add(telefoneInput);
    email_campos.add(emailInput);
    super.initState();
  }

  ScrollController _scrollerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClienteProvider>(
        create: (context) => ClienteProvider(),
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: [
                ListView(
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
                Center(child: Consumer<ClienteProvider>(
                    builder: (context, provider, child) {
                  return Card(
                    elevation: 3.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Form(
                          autovalidate: true,
                          key: _formKey,
                          child: ListView(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(30),
                                  child: Center(
                                    child: Text(
                                      "Os clientes são nossa prioridade!",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 30,
                                          color: Colors.blueGrey),
                                    ),
                                  )),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                  height:
                                      MediaQuery.of(context).size.height / 1.7,
                                ),
                                child: Stepper(
                                    physics: ClampingScrollPhysics(),
                                    type: StepperType.horizontal,
                                    currentStep: this.currStep,
                                    onStepContinue: () {
                                      setState(() {
                                        if (currStep < 2) {
                                          currStep = currStep + 1;
                                        } else {
                                          listTelefones =
                                              Telefones(provider.telefones);
                                          listEmails = Emails(provider.emails);
                                          Cliente cliente = new Cliente(
                                              provider.username,
                                              provider.password,
                                              provider.zip,
                                              provider.logradouro,
                                              provider.bairro,
                                              provider.cidade,
                                              provider.uf,
                                              provider.complemento,
                                              provider.emails,
                                              provider.telefones);
                                          _validateAndSubmit(cliente);
                                          provider.removeEmail();
                                          provider.removeTel();
//                                          print(listEmails.toJson());
                                        }
                                      });
                                    },
                                    onStepCancel: () {
                                      setState(() {
                                        if (currStep > 0) {
                                          currStep = currStep - 1;
                                        } else {
                                          currStep = 0;
                                        }
                                      });
                                    },
                                    onStepTapped: (step) {
                                      setState(() {
                                        currStep = step;
                                      });
                                    },
                                    steps: [
                                      new Step(
                                          isActive: true,
                                          state: StepState.indexed,
                                          title: Text("Dados Pessoais"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              biInput,
                                              usernameInput,
//                                      passwordInput(pass),
                                              passwordInput,
                                            ],
                                          )),
                                      new Step(
                                          isActive: true,
                                          state: StepState.indexed,
                                          title: Text("Endereço"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              zipInput,
                                              logradouroInput,
                                              bairroInput,
                                              cidadeInput,
                                              ufInput,
                                              complementoInput,
                                            ],
                                          )),
                                      new Step(
                                          isActive: true,
                                          state: StepState.indexed,
                                          title: Text("Contacto"),
                                          content: ConstrainedBox(
                                            constraints:
                                                BoxConstraints.tightFor(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.9,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  child: Scrollbar(
                                                    isAlwaysShown: true,
                                                    controller:
                                                        _scrollerController,
                                                    child: ListView.builder(
                                                      controller:
                                                          _scrollerController,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            telefones_campos[
                                                                index],
                                                            index == 0
                                                                ? IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .add),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        telefones_campos
                                                                            .add(telefoneInput);
                                                                      });
                                                                    })
                                                                : IconButton(
                                                                    icon: Icon(Icons
                                                                        .remove),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        telefones_campos
                                                                            .removeAt(index);
                                                                      });
                                                                    })
                                                          ],
                                                        );
                                                      },
                                                      itemCount:
                                                          telefones_campos
                                                              .length,
                                                    ),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  child: ListView.builder(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          email_campos[index],
                                                          index == 0
                                                              ? IconButton(
                                                                  icon: Icon(
                                                                      Icons
                                                                          .add),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      email_campos
                                                                          .add(
                                                                              emailInput);
                                                                    });
                                                                  })
                                                              : IconButton(
                                                                  icon: Icon(Icons
                                                                      .remove),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      email_campos
                                                                          .removeAt(
                                                                              index);
                                                                    });
                                                                  })
                                                        ],
                                                      );
                                                    },
                                                    itemCount:
                                                        email_campos.length,
                                                  ),
                                                )),
                                              ],
                                            ),
                                          )),
                                    ]),
                              ),
//                              currStep == 2
//                                  ? Column(
//                                      children: [
//                                        isLoading
//                                            ? LoadingIndicator()
//                                            : PrimaryButton(
//                                                'Cadastrar',
//                                                _validateAndSubmit(
//                                                    provider.telefones,
//                                                    provider.emails)),
//                                        SecondaryButton(
//                                            'Possui uma conta? Entre', '/login')
//                                      ],
//                                    )
//                                  : Container()
                            ],
                          )),
                    ),
                  );
                })),
              ],
            ),
          );
        });
  }

  _validateAndSubmit(cliente) {
    ClienteController clienteController = ClienteController();
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      try {
        clienteController.cadastrar(cliente);
//        print(cliente.toJson());
      } catch (e) {}
    }
  }
}
