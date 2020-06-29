import 'package:flutter/material.dart';
import 'package:technoplus_CRUD/controllers/ClienteController.dart';
import 'package:technoplus_CRUD/models/Cliente.dart';
import 'package:technoplus_CRUD/widgets/background.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ClienteController clienteController = new ClienteController();
  var currentUser;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    currentUser = routeArgs['user'];
    return Scaffold(
        body: background(
            context,
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(40),
              width: MediaQuery.of(context).size.height / 0.7,
              child: Expanded(
                  child: SingleChildScrollView(
                child: FutureBuilder(
                  future: clienteController.getClientes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return buildListTile(index, snapshot.data);
                        },
                        itemCount: snapshot.data.length,
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                          child: Text(
                              "Erro de conexão! Não foi possível carregar os dados"));
                    }
                    return Center(
                        heightFactor: 5, child: CircularProgressIndicator());
                  },
                ),
              )),
            )));
  }

  buildListTile(int index, List<Cliente> snapshotData) {
    return GestureDetector(
      onTap: () {
        currentUser == "admin"
            ? Navigator.of(context).pushNamed('/details',
                arguments: {'cliente': snapshotData[index]})
            : null;
      },
      child: ListTile(
        title: Text(snapshotData[index].username),
        subtitle: Row(
          children: [
            Text(snapshotData[index].cidade),
            Text(snapshotData[index].logradouro)
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          //Confirmar remoção
          onPressed: () => clienteController.delete(snapshotData[index].id),
        ),
      ),
    );
  }
}
