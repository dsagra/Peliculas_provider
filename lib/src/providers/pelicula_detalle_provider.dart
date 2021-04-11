import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula.dart';

import 'package:peliculas_con_provider/src/clases/pelicula_detalle.dart';

import 'api_key.dart';

class PeliculaDetalleProvider extends ChangeNotifier {
  PeliculaDetalle _pelicula;

  PeliculaDetalle get getPeliculaDetalle => _pelicula;

  void cambiarPeliculaDetalle(Pelicula pelicula) {
    obtenerDetallePelicula(pelicula);
  }

  void setPelicula(PeliculaDetalle pelicula) {
    _pelicula = pelicula;
    notifyListeners();
  }

  Future<PeliculaDetalle> obtenerDetallePelicula(Pelicula pelicula) async {
    String url = 'https://api.themoviedb.org/3/movie/' +
        pelicula.id.toString() +
        '?language=es&api_key=' +
        apiKey;
    try {
      Response response = await Dio().get(url);
      final json = response.data;
      setPelicula(PeliculaDetalle.fromJson(response.data));
    } catch (e) {
      return null;
    }
  }
}
