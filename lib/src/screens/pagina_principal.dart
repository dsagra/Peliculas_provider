import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/screens/pantalla_de_busqueda.dart';
import 'package:peliculas_con_provider/src/widgets/lista_de_peliculas.dart';
import 'package:peliculas_con_provider/src/widgets/lista_de_peliculas_en_cartelera.dart';
import 'package:peliculas_con_provider/src/widgets/lista_de_peliculas_proximamente.dart';
import 'package:peliculas_con_provider/src/widgets/titulo_principal.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('images/logo.png'),
            onPressed: () {},
          ),
          automaticallyImplyLeading: false,
          title: Text('Peliculas'),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaginaPrincipal();
                }));
              },
            ),
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PantallaDeBusqueda();
                }));
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home_fondo_gris.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TituloPrincipal('Las más populares'),
                  ListaDePeliculas(),
                  TituloPrincipal('En cartelera'),
                  ListaDePeliculasEnCartelera(),
                  TituloPrincipal('Proximamente...'),
                  ListaDePeliculasProximamente(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
