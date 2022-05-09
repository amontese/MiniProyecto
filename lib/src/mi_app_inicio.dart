import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/pages/home_page.dart';

class MiAppInicio extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //child: PaginaInicio(),
        child: HomePage(),
      ),
    );
  }
}
