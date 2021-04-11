import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula.dart';
import 'package:peliculas_con_provider/src/screens/pagina_detalle_pelicula.dart';

class PeliculaWidget extends StatelessWidget {
  PeliculaWidget({this.pelicula});
  Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaDetallePelicula(
            pelicula: pelicula,
          ),
        ),
      ),
      child: Card(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        child: Container(
          width: 150,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FadeInImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w200/${pelicula.posterPath}"),
                    placeholder: AssetImage("images/foto_error.jpg"),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "images/foto_error.jpg",
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  pelicula.title,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
