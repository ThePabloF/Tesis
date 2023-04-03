// To parse this JSON data, do
//
//     final informacionUsuario = informacionUsuarioFromJson(jsonString);

import 'dart:convert';

InformacionUsuario informacionUsuarioFromJson(String str) => InformacionUsuario.fromJson(json.decode(str));

//String informacionUsuarioToJson(InformacionUsuario data) => json.encode(data.toJson());

class InformacionUsuario {
    InformacionUsuario({
         this.apellidos,
         this.alergias,
         this.correo,
         this.nombres,
         this.indice,
         this.objetivo,
    });

    String ?apellidos;
    Map<String, int> ?alergias;
    String ?correo;
    String ?nombres;
    String ?indice;
    String ?objetivo;

    factory InformacionUsuario.fromJson(Map<String, dynamic> json) => InformacionUsuario(
        apellidos: json["apellidos"],
        alergias: Map.from(json["alergias"]).map((k, v) => MapEntry<String, int>(k, v)),
        correo: json["correo"],
        nombres: json["nombres"],
        indice: json["indice"],
        objetivo: json["objetivo"],
    );

    InformacionUsuario.fromJson2(Map<String, dynamic> json):this(
        apellidos: json["apellidos"] ,
        alergias: Map.from(json["alergias"]).map((k, v) => MapEntry<String, int>(k, v)),
        correo: json["correo"],
        nombres: json["nombres"],
        indice: json["indice"],
        objetivo: json["objetivo"],
    );
    Map<String, dynamic> toJson(Map<String, dynamic> informacionUsuario) {
      return {
 "apellidos": apellidos,
        "alergias": Map.from(alergias!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "correo": correo,
        "nombres": nombres,
        "indice": indice,
        "objetivo": objetivo,
      };
    
    
    }
      Map<String, dynamic> toJson2() {
      return {
 "apellidos": apellidos,
        "alergias": Map.from(alergias!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "correo": correo,
        "nombres": nombres,
        "indice": indice,
        "objetivo": objetivo,
      };

 }
}
