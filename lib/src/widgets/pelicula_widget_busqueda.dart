import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula.dart';
import 'package:peliculas_con_provider/src/screens/pagina_detalle_pelicula.dart';

class PeliculaWidgetBusqueda extends StatelessWidget {
  PeliculaWidgetBusqueda({this.pelicula});
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
        child: Row(
          children: [
            Container(
              width: 150,
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
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Titulo: ' + pelicula.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Año: ${pelicula.releaseDate.substring(0, 4)}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
