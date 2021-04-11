import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/screens/pagina_busqueda_resultados.dart';
import 'package:peliculas_con_provider/src/screens/pagina_principal.dart';

class PantallaDeBusqueda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Buscar una pelicula'),
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
      body: PantallaBuscar(),
    );
  }
}

class PantallaBuscar extends StatelessWidget {
  String buscar = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          TextField(
            onChanged: (valor) {
              buscar = valor;
            },
            decoration: InputDecoration(
              hintText: 'Ingrese pelicula a buscar',
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaginaBusquedaResultados(buscar)),
            ),
            child: Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
