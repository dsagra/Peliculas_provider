class Genero {
  Genero({
    this.id,
    this.nombre,
  });

  int id;
  String nombre;

  factory Genero.fromJson(Map<String, dynamic> json) => Genero(
        id: json["id"],
        nombre: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
