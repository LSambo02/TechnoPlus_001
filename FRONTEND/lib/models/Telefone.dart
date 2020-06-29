import 'dart:convert';

class Telefone {
  String numero;
  var id, tipo;
  Telefone(this.numero, this.tipo, {this.id});

  Telefone.fromJson(Map<String, dynamic> json) {
    id = json['idtelefone'];
    numero = json['telefoneNumero'];
    tipo = json['tipoTelefone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telefoneNumero'] = this.numero;
    data['tipoTelefone_id'] = this.tipo;
    return data;
  }
}

class Telefones {
  List<Telefone> telefones;

  Telefones(this.telefones);

  String toJson() => jsonEncode(telefones);
}
