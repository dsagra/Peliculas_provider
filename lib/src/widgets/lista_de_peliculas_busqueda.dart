import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_buscar.dart';

import 'package:peliculas_con_provider/src/widgets/pelicula_widget_busqueda.dart';
import 'package:provider/provider.dart';

class ListaDePeliculasBusqueda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      child: Consumer<PeliculasBusquedaProvider>(
        builder: (context, data, child) => data.listaDePeliculas != null
            ? ListView.builder(
                itemBuilder: (context, index) => PeliculaWidgetBusqueda(
                  pelicula: data.listaDePeliculas[index],
                ),
                itemCount: data.listaDePeliculas.length,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
