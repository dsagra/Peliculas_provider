import 'package:flutter/material.dart';

class TituloPrincipal extends StatelessWidget {
  TituloPrincipal(String titulo) {
    this.titulo = titulo;
  }
  String titulo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(0, 0, 0, 0.3),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(titulo,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}
