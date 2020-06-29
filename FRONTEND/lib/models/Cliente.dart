import 'Email.dart';
import 'Telefone.dart';

class Cliente {
  String id,
      username,
      userpass,
      zip,
      logradouro,
      bairro,
      cidade,
      uf,
      complemento;

  List<Email> emails;
  List<Telefone> telefones;

  Cliente(this.username, this.userpass, this.zip, this.logradouro, this.bairro,
      this.cidade, this.uf, this.complemento, this.emails, this.telefones,
      {this.id});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['iduser'];
    username = json['username'];
    userpass = json['userpass'];
    zip = json['zip'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    complemento = json['complemento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userpass'] = this.userpass;
    data['zip'] = this.zip;
    data['logradouro'] = this.logradouro;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['complemento'] = this.complemento;
    data['emails'] = this.emails;
    data['telefones'] = this.telefones;
    return data;
  }
}
