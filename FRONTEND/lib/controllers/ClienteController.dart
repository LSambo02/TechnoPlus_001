import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technoplus_CRUD/models/Cliente.dart';

class ClienteController {
  List listaClientes = [];

  cadastrar(Cliente cliente) async {
//    print("ja ta");

    //Telefones listTelefones = Telefones(cliente.telefone);
    //Emails listEmails = Emails(cliente.email);
    var reply;

    var jsonCliente = cliente.toJson();
//        jsonTelefones = listTelefones.toJson(),
//        jsonEmails = listEmails.toJson();
    print(json.encode(jsonCliente).toString());
//172.20.10.4
    var response = await http.post(
        "localhost:8888/technoplus_CRUD/actions/user/create.php",
        headers: {
          'Access-Control-Allow-Origin': 'http://localhost',
          'Access-Control-Allow-Methods': 'POST',
          'Content-type': 'application/json',
          'Access-Control-Allow-Headers':
              'Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods'
        },
        body: json.encode(jsonCliente));

    if (response.statusCode == 200) {
      reply = response.body;
      print(reply);
    } else {
      reply = "${response.statusCode}: Erro ao gravar os dados";
      print(reply);
    }

    return reply;
  }

  Future<List<Cliente>> getClientes() async {
    final response =
        await http.get("localhost:8888/technoplus_CRUD/actions/user/read.php");
    var jsonData = json.decode(response.body);
    listaClientes = new List<Cliente>();

    for (var ad in jsonData) {
      Cliente cliente = Cliente.fromJson(ad);

      listaClientes.add(cliente);
    }

    return listaClientes;
  }

  Future<http.Response> delete(String id) async {
    final http.Response response = await http.delete(
      'localhost:8888/technoplus_CRUD/actions/user/delete?id=$id',
      headers: {
        'Content-Type': 'application/json; ',
      },
    );

    return response;
  }
}
