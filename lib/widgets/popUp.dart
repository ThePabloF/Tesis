import 'package:flutter/material.dart';

Widget popUpMalLogueo(BuildContext context) {
  print("llego");
  return AlertDialog(
    title: const Text('Fallo al iniciar sesión'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Revise su usuario y contraseña"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cerrar'),
      ),
    ],
  );
}
