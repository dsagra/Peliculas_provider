import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_buscar.dart';
import 'package:peliculas_con_provider/src/screens/pagina_principal.dart';
import 'package:peliculas_con_provider/src/screens/pantalla_de_busqueda.dart';
import 'package:peliculas_con_provider/src/widgets/lista_de_peliculas_busqueda.dart';
import 'package:peliculas_con_provider/src/widgets/titulo_principal.dart';
import 'package:provider/provider.dart';

class PaginaBusquedaResultados extends StatelessWidget {
  PaginaBusquedaResultados(String buscar) {
    this.buscar = buscar;
  }
  String buscar;

  @override
  Widget build(BuildContext context) {
    Provider.of<PeliculasBusquedaProvider>(context, listen: false)
        .obtenerPeliculas(buscar);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Busqueda'),
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
                  TituloPrincipal('Busqueda: $buscar'),
                  ListaDePeliculasBusqueda(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
