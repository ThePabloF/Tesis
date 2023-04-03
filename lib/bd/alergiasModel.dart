// To parse this JSON data, do
//
//     final herramienta = herramientaFromJson(jsonString);

import 'dart:convert';

AlergiasList herramientaFromJson(String str) =>
    AlergiasList.fromJson(json.decode(str));

String herramientaToJson(AlergiasList data) => json.encode(data.toJson());

class AlergiasList {
  AlergiasList({
    required  this.index,
    required this.descripcion,
    required this.disponibilidad,
   
  });

  int index;
  String descripcion;
  bool disponibilidad;

  factory AlergiasList.fromJson(Map<String, dynamic> json) => AlergiasList(
        index: json["index"],
        descripcion: json["descripcion"],
        disponibilidad: json["disponibilidad"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "descripcion": descripcion,
        "disponibilidad": disponibilidad,
      };
}