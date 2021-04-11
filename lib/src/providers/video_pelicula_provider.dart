import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula.dart';
import 'package:peliculas_con_provider/src/clases/video_pelicula.dart';
import 'package:peliculas_con_provider/src/providers/api_key.dart';

class VideoPeliculaProvider extends ChangeNotifier {
  VideoPelicula _video;

  VideoPelicula get getVideoPelicula => _video;

  void setPelicula(VideoPelicula video) {
    _video = video;
    notifyListeners();
  }

  void setVideo(int id) {
    obtenerVideo(id);
  }

  Future<VideoPelicula> obtenerVideo(int id) async {
    setPelicula(VideoPelicula(key: ''));
    notifyListeners();
    String url = 'https://api.themoviedb.org/3/movie/' +
        id.toString() +
        '/videos?api_key=' +
        apiKey +
        '&language=es';
    try {
      Response response = await Dio().get(url);
      final json = response.data['results'];
      var listadoDePeliculas = json
          .map((peliculaJson) => VideoPelicula.fromJson(peliculaJson))
          .toList();

      setPelicula(listadoDePeliculas[0]);
    } catch (e) {
      setPelicula(VideoPelicula(key: ''));
      notifyListeners();
    }
  }
}
