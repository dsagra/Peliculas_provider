import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/clases/pelicula_detalle.dart';
import 'package:peliculas_con_provider/src/providers/pelicula_detalle_provider.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_similares.dart';
import 'package:peliculas_con_provider/src/providers/video_pelicula_provider.dart';
import 'package:peliculas_con_provider/src/screens/pagina_principal.dart';
import 'package:peliculas_con_provider/src/screens/pantalla_de_busqueda.dart';
import 'package:peliculas_con_provider/src/widgets/lista_de_peliculas_similares.dart';
import 'package:peliculas_con_provider/src/widgets/mostrar_video.dart';
import 'package:peliculas_con_provider/src/widgets/titulo_principal.dart';
import 'package:provider/provider.dart';

import '../clases/pelicula.dart';

class PantallaDetallePelicula extends StatelessWidget {
  PantallaDetallePelicula({Key key, this.pelicula}) : super(key: key);

  Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    Provider.of<PeliculaDetalleProvider>(context, listen: false)
        .cambiarPeliculaDetalle(pelicula);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(pelicula.title),
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
      body: Consumer<PeliculaDetalleProvider>(
        builder: (context, data, child) => data.getPeliculaDetalle != null
            ? verPeliculaDetalle(data.getPeliculaDetalle)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class verPeliculaDetalle extends StatelessWidget {
  verPeliculaDetalle(PeliculaDetalle peliculaDetalle) {
    this.peliculaDetalle = peliculaDetalle;
  }

  PeliculaDetalle peliculaDetalle;
  @override
  Widget build(BuildContext context) {
    Provider.of<VideoPeliculaProvider>(context, listen: false)
        .setVideo(peliculaDetalle.id);
    Provider.of<PeliculasSimilaresProvider>(context, listen: false)
        .obtenerPeliculas('${peliculaDetalle.id}/similar');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/home_fondo_detalle.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Consumer<VideoPeliculaProvider>(
              builder: (context, data, child) => data.getVideoPelicula != null
                  ? mostrarVideo(data.getVideoPelicula.key, peliculaDetalle)
                  : Center(child: CircularProgressIndicator()),
            ),
            TituloPrincipal(peliculaDetalle.title),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${peliculaDetalle.originalTitle} (Titulo original)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text('${peliculaDetalle.voteAverage.toString()} / 10'),
                    ],
                  ),
                  Text(
                      '${peliculaDetalle.releaseDate.substring(0, 4)} - Duracion: ${peliculaDetalle.runTime} minutos'),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                for (var i = 0; i < peliculaDetalle.genres.length; i++)
                  //Text('${peliculaDetalle.genres[i].name}'),
                  Chip(
                    label: Text(
                      '${peliculaDetalle.genres[i].nombre}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${peliculaDetalle.tagline}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                peliculaDetalle.overview,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),
            TituloPrincipal('Peliculas similares'),
            ListaDePeliculasSimilares(),
          ],
        ),
      ),
    );
  }
}
