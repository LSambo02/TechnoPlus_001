import 'dart:convert';

class Email {
  String id, endereco;

  Email(this.endereco, {this.id});

  Email.fromJson(Map<String, dynamic> json) {
    id = json['idemail'];
    endereco = json['emailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this.endereco;
    return data;
  }
}

class Emails {
  List<Email> emails;

  Emails(this.emails);

  String toJson() => jsonEncode(emails);
}
