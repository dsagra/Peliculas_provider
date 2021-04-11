class VideoPelicula {
  String key;

  VideoPelicula({this.key});

  factory VideoPelicula.fromJson(Map<String, dynamic> json) {
    final key = json['key'];
    return VideoPelicula(key: key);
  }
}
