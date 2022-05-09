import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaginaRegistro extends StatefulWidget {
  //const PaginaRegistro({Key? key}) : super(key: key);
  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  List<String> items = [
    '---Tipo Compra---',
    "Mercado Mensual",
    'Mercado Semanal',
    'Otros'
  ];
  final _monedaRadio = ['Bs', 'Dol'];
  String _moedaSelec = '';
  String? valorSelec = "---Tipo Compra---";
  String valorTexto = "";
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de compras"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                value: valorSelec,
                items: items.map((value) {
                  return DropdownMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart_sharp,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          value,
                          style: _textStyle(context),
                        )
                      ],
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (nuevoValor) {
                  setState(() {
                    valorSelec = nuevoValor.toString();
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              /*_textos(context, "Tipo Compra"),
              _textField(context, "Ingresar tipo de compra"),
              SizedBox(
                height: 10.0,
              ),*/
              _textos(context, "Identificador"),
              _textField(context, "Ingrese un identificador de su compra"),
              SizedBox(
                height: 10.0,
              ),
              //_textos(context, "Presupuesto"),
              //_textField(context, "Ingresar su presupuesto"),
              _textFormatField(context),
              SizedBox(
                height: 10.0,
              )
              /*RadioButtonGroup(
                labels: _monedaRadio,
                activeColor: Colors.greenAccent,
                onSelected: (selected) {
                  setState(() {
                    _moedaSelec = selected;
                  });
                },
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textos(BuildContext context, String tipo) {
  return Text(tipo, style: _textStyle(context));
}

TextStyle _textStyle(BuildContext context) {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue);
}

Widget _textField(BuildContext context, String hindText) {
  return TextField(
    decoration: InputDecoration(
      hintText: hindText,
      /*border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),*/
    ),
    autofocus: true,
    textInputAction: TextInputAction.next,
  );
}

Widget _textFormatField(BuildContext context) {
  return TextFormField(
    keyboardType: TextInputType.number,
    maxLines: 1,
    textAlign: TextAlign.left,
    validator: (value) {
      final intNumber = int.tryParse(value!);
      if (intNumber != null && intNumber <= 10) {
        return null;
      }
      return 'Ingrese el numero';
    },
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    controller: TextEditingController(
      text: '0',
    ),
    decoration: InputDecoration(
      hintText: 'Escribe el precio de compra',
      labelText: "Presupuesto",
      labelStyle: _textStyle(context),
    ),
  );
}

/*
Widget _comboBox(BuildContext context, String Aux){

  return DropdownButton(
    value: valorSelec,
    items: items.map((value) {
      return DropdownMenuItem(
        child: Row(
          children: [
            Icon(Icons.settings, size: 15,),
            SizedBox(width: 10.0,),
            Text(value)
          ],
        ),
        value: value,
      );
    }).toList(),
    onChanged: (nuevoValor) {
      setState(() {
        valorSelec = nuevoValor.toString();
      });
    },
  )
}
*/
