import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/pages/carro.dart';
import 'package:mini_proyecto/src/pages/vendedores_vista.dart';

class HomePage extends StatelessWidget {
  //const HomePage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vendedores'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Carro())),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Alvaro Montes Baldivieso',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'alvaroe@curflutter.com',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/avatarperfil.png'),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
              ),
              ListTile(
                title: Text('Usuario'),
              ),
              ListTile(
                title: Text('Perfil'),
                leading: Icon(Icons.account_circle),
                onTap: () {},
              ),
              ListTile(
                title: Text('Salir'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
        ),
        body: VendedoresVista(),
      ),
    );
  }
}
