import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/screens/pagina_inicio.dart';
import 'package:peliculas_con_provider/src/screens/pagina_principal.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PaginaPrincipal()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaginaDeInicio();
  }
}
