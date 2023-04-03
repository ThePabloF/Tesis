// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

Productos? productosFromJson(String str) => Productos.fromJson(json.decode(str));

String productosToJson(Productos? data) => json.encode(data!.toJson());

class Productos {
    Productos({
        this.productos,
    });

    List<Producto?>? productos;

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        productos: json["productos"] == null ? [] : List<Producto?>.from(json["productos"]!.map((x) => Producto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "productos": productos == null ? [] : List<dynamic>.from(productos!.map((x) => x!.toJson())),
    };
}

class Producto {
    Producto({
        this.id,
        this.nombre,
        this.precio,
        this.cantidad,
        this.url,
    });

    String? id;
    String? nombre;
    String? precio;
    int? cantidad;
    String? url;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        cantidad: json["cantidad"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "cantidad": cantidad,
        "url": url,
    };
}
