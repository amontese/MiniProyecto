import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/pages/pagina_registro.dart';
import 'package:mini_proyecto/src/pages/pagina_reporte.dart';

class PaginaInicio extends StatefulWidget {
  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  final tabs = [
    Center(
      child: PaginaReporte(),
    ),
    Center(
      child: PaginaRegistro(),
    )
  ];
  int _indiceactual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Compras"),
        titleTextStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: 35.0),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: tabs[_indiceactual],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.tealAccent,
          iconSize: 40.0,
          selectedItemColor: Colors.blue,
          selectedFontSize: 30.0,
          unselectedFontSize: 20.0,
          currentIndex: _indiceactual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_drive_file_outlined), label: "Detalle"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_sharp), label: "Nuevo")
          ],
          onTap: (index) {
            setState(() {
              _indiceactual = index;
            });
          }),
    );
  }
}
