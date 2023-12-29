// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

Post postFromMap(String str) => Post.fromMap(json.decode(str));

String postToMap(Post data) => json.encode(data.toMap());

class Post {
  String titulo;
  String secccion;
  String direccionUrl;

  Post({
    required this.titulo,
    required this.secccion,
    required this.direccionUrl,
  });

  Post copyWith({
    String? titulo,
    String? secccion,
    String? direccionUrl,
  }) =>
      Post(
        titulo: titulo ?? this.titulo,
        secccion: secccion ?? this.secccion,
        direccionUrl: direccionUrl ?? this.direccionUrl,
      );

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    titulo: json["titulo"],
    secccion: json["secccion"],
    direccionUrl: json["direccion_url"],
  );

  Map<String, dynamic> toMap() => {
    "titulo": titulo,
    "secccion": secccion,
    "direccion_url": direccionUrl,
  };
}
