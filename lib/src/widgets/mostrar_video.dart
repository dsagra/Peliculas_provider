import 'package:flutter/material.dart';

import 'package:peliculas_con_provider/src/clases/pelicula_detalle.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

mostrarVideo(String key, PeliculaDetalle peliculaDetalle) {
  if (key == '') {
    return FadeInImage(
      image: NetworkImage(
          "https://image.tmdb.org/t/p/w500/${peliculaDetalle.backdropPath}"),
      placeholder: AssetImage("images/foto_error2.jpg"),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "images/foto_error2.jpg",
        );
      },
    );
  } else {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: key,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
    );
  }
}
