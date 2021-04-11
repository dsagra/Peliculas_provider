import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_cartelera_provider.dart';
import 'package:peliculas_con_provider/src/widgets/pelicula_widget.dart';
import 'package:provider/provider.dart';

class ListaDePeliculasEnCartelera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Consumer<PeliculasEnCarteleraProvider>(
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
