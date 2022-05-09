import 'package:flutter/material.dart';

class Carro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarroState();
}

class _CarroState extends State<Carro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Carrito!'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }
}
