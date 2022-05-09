import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/models.dart';

class VendedorVistaTotal extends StatefulWidget {
  VendedorVistaTotal({Key? key, required this.vendedor}) : super(key: key);

  final VendedorVista vendedor;

  @override
  State<StatefulWidget> createState() => _VendedorVistaTotalState();
}

class _VendedorVistaTotalState extends State<VendedorVistaTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.vendedor.nombre),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage:
                  AssetImage('images/marca' + widget.vendedor.uid + '.png'),
              radius: 100,
            ),
            SizedBox(
              height: 20,
            ),
            /*ListTile(
              title: Text('Descripción:'),
              subtitle: Text(widget.vendedor.descripcion),
            ),*/
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title:
                            Text('Modelo ' + widget.vendedor.modelo.toString()),
                        trailing: Text('\$' + widget.vendedor.precio.toString(),
                            style: TextStyle(color: Colors.cyan, fontSize: 23)),
                      ),
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  content: Image.asset('images/modelo' +
                                      widget.vendedor.uid +
                                      '.png'),
                                )),
                        child: Image.asset(
                          'images/modelo' + widget.vendedor.uid + '.png',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Cantidad: ' + '1'),
                          RaisedButton(
                            color: Colors.cyan,
                            child: Text(
                              'Añadir a canasta',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
