import 'package:flutter/material.dart';
import 'package:technoplus_CRUD/models/Email.dart';
import 'package:technoplus_CRUD/models/Telefone.dart';

class ClienteProvider extends ChangeNotifier {
  List<Email> _emails = [];
  List<Telefone> _telefones = [];
  String _bi,
      _complemento,
      _zip,
      _bairro,
      _cidade,
      _uf,
      _logradouro,
      _username,
      _password;

  setBi(bi) {
    _bi = bi;
    notifyListeners();
  }

  setcomplemento(complemento) {
    _complemento = complemento;
    notifyListeners();
  }

  setZip(zip) {
    _zip = zip;
    notifyListeners();
  }

  setBairro(bairro) {
    _bairro = bairro;
    notifyListeners();
  }

  setCidade(cidade) {
    _cidade = cidade;
    notifyListeners();
  }

  setUf(uf) {
    _uf = uf;
    notifyListeners();
  }

  setLogradouro(logradouro) {
    _logradouro = logradouro;
    notifyListeners();
  }

  setUsername(username) {
    _username = username;
    notifyListeners();
  }

  setPassword(password) {
    _password = password;
    notifyListeners();
  }

  updateEmailList(email) {
    _emails.add(email);

    notifyListeners();
  }

  updateTelList(telefone) {
    _telefones.add(telefone);

    notifyListeners();
  }

  removeTel() {
    _telefones = [];
    notifyListeners();
  }

  removeEmail() {
    _emails = [];
    notifyListeners();
  }

  List<Email> get emails => _emails;
  List<Telefone> get telefones => _telefones;

  String get password => _password;

  String get username => _username;

  String get logradouro => _logradouro;

  String get uf => _uf;

  String get cidade => _cidade;

  String get bairro => _bairro;

  String get zip => _zip;

  String get complemento => _complemento;

  String get bi => _bi;
}
