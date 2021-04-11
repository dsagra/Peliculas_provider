import 'package:flutter/material.dart';
import 'package:peliculas_con_provider/src/providers/pelicula_detalle_provider.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_cartelera_provider.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_buscar.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_proximamente.dart';
import 'package:peliculas_con_provider/src/providers/peliculas_provider_similares.dart';
import 'package:peliculas_con_provider/src/providers/video_pelicula_provider.dart';
import 'package:peliculas_con_provider/src/screens/slash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PeliculasProvider.init('popular')),
        ChangeNotifierProvider(
            create: (context) =>
                PeliculasEnCarteleraProvider.init('now_playing')),
        ChangeNotifierProvider(
            create: (context) =>
                PeliculasProximamenteProvider.init('upcoming')),
        ChangeNotifierProvider(create: (context) => PeliculaDetalleProvider()),
        ChangeNotifierProvider(create: (context) => VideoPeliculaProvider()),
        ChangeNotifierProvider(
            create: (context) => PeliculasSimilaresProvider()),
        ChangeNotifierProvider(
            create: (context) => PeliculasBusquedaProvider()),
      ],
      child: MaterialApp(
        title: 'Peliculas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
