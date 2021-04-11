import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula.dart';

import 'api_key.dart';

class PeliculasProvider extends ChangeNotifier {
  List<Pelicula> _peliculas;

  List<Pelicula> get listaDePeliculas => _peliculas;

  void agregarLista(List<Pelicula> listado) {
    _peliculas = listado;
    notifyListeners();
  }

  PeliculasProvider.init(String clasificacion) {
    obtenerPeliculas(clasificacion);
  }

  Future<List<Pelicula>> obtenerPeliculas(String clasificacion) async {
    String url = 'https://api.themoviedb.org/3/movie/' +
        clasificacion +
        '?language=es&api_key=' +
        apiKey;
    try {
      Response response = await Dio().get(url);
      final json = response.data['results'];

      var listadoDePeliculas =
          json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();

      agregarLista(List<Pelicula>.from(listadoDePeliculas));
    } catch (e) {
      return [];
    }
  }
}
