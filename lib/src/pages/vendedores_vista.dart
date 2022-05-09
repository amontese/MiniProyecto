import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/pages/vendedor_vista_total.dart';

import '../models.dart';

class VendedoresVista extends StatefulWidget {
  //VendedoresVista({required Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _VendedoresVistaState();
}

class _VendedoresVistaState extends State<VendedoresVista> {
  String _id = '';
  String _nombreNuevo = '';
  String _marca = '';
  String _modelo = '';
  String _error = '';
  List<VendedorVista> _dataList = [
    VendedorVista(
        nombre: 'Juan Perez',
        // descripcion: 'Renault',
        uid: '1',
        marca: 'Renault',
        modelo: 'Koleos',
        precio: 44000.0),
    VendedorVista(
        nombre: 'Pedro Paco',
        // descripcion: 'Suzuki',
        uid: '2',
        marca: 'Suzuki',
        modelo: 'Jimmy',
        precio: 21000.0),
    VendedorVista(
        nombre: 'Claudia Quispe',
        // descripcion: 'Changan',
        uid: '3',
        marca: 'Changan',
        modelo: 'CS15',
        precio: 16000.0),
    VendedorVista(
        nombre: 'Javier Mamani',
        // descripcion: 'Mercedes',
        uid: '4',
        marca: 'Mercedes',
        modelo: 'GLE COUPE',
        precio: 85000.0),
    VendedorVista(
        nombre: 'Martha Sanchez',
        //   descripcion: 'Nissan',
        uid: '5',
        marca: 'Nissan',
        modelo: 'Sentra',
        precio: 20000.0),
  ];

  @override
  Widget build(BuildContext context) {
    List<ListTile> _listTiles = _dataList
        .map((vendedor) => ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('images/avatar' + vendedor.uid + '.png'),
              ),
              title: Text(vendedor.nombre),
              subtitle: Text(vendedor.marca),
              trailing: Icon(
                Icons.arrow_drop_down,
                size: 40,
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      VendedorVistaTotal(vendedor: vendedor))),
            ))
        .toList();

    return Scaffold(
      body: Container(
        child: ListView(
          children: _listTiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Crear vendedor nuevo'),
                  TextFormField(
                    onChanged: (value) => _id = value,
                    decoration: InputDecoration(
                      hintText: 'Id',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => _nombreNuevo = value,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => _marca = value,
                    decoration: InputDecoration(
                      hintText: 'Marca',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => _modelo = value,
                    decoration: InputDecoration(
                      hintText: 'Modelo',
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'Crear',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.cyan,
                    elevation: 7,
                    onPressed: () {
                      if (_nombreNuevo != null && _nombreNuevo != '') {
                        if (_marca != null && _marca != '') {
                          setState(() {
                            _dataList.add(VendedorVista(
                                nombre: _nombreNuevo,
                                marca: _marca,
                                uid: _id,
                                modelo: _modelo));
                            //print('Prueba ' + _nombre2);
                          });
                          Navigator.of(context).pop();
                        } else {
                          //no ingresó la descripción
                          _error = 'Ingresa su descripción';
                          _alert(context, _error);
                        }
                      } else {
                        //no ingresó el nombre
                        setState(() {
                          _error = 'Ingresa su nombre';
                          _alert(context, _error);
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Future _alert(BuildContext context, String _error) {
  return /*showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Show Alert Dialog Box"),
      content: Text("You have raised a Alert Dialog Box"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: Text("Ok"),
        ),
      ],
    ),
  );*/

      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Text(_error),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ));
}
