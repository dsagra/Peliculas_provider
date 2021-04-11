import 'package:flutter/material.dart';

import 'package:peliculas_con_provider/src/providers/peliculas_provider_similares.dart';
import 'package:peliculas_con_provider/src/widgets/pelicula_widget.dart';
import 'package:provider/provider.dart';

class ListaDePeliculasSimilares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Consumer<PeliculasSimilaresProvider>(
        builder: (context, data, child) => data.listaDePeliculas != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: data.listaDePeliculas[index],
                ),
                itemCount: data.listaDePeliculas.length,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
