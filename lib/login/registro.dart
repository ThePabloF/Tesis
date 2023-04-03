import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pablo/bd/globales.dart';
import 'package:firebase_pablo/login/indiceMasaCorporal.dart';
import 'package:firebase_pablo/login/login.dart';
import 'package:firebase_pablo/services/serviciosFirebase.dart';
import 'package:flutter/material.dart';

class RegistroUsuario extends StatelessWidget {
  const RegistroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    ServiciosFirebase servicios = ServiciosFirebase();
    TextEditingController nombreUsuario = TextEditingController();
    TextEditingController correoUsuario = TextEditingController();
    TextEditingController apellidoUsuario = TextEditingController();
        TextEditingController contrasena = TextEditingController();

    return Scaffold(
      body: Column(children: [
        TextField(
          controller: nombreUsuario,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: "Nombre"),
        ),
        const SizedBox(
          height: 20,
        ),
                TextField(
          controller: apellidoUsuario,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: "Apellido"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: correoUsuario,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: "Correo Electrónico"),
        ),
        const SizedBox(
          height: 20,
        ),
           TextField(
          controller: contrasena,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: "Contraseña"),
        ),
        const SizedBox(
          height: 20,
        ),


        ElevatedButton(
            onPressed: () async {
            

    Globales.personasAlergias.nombres = nombreUsuario.text;
    Globales.personasAlergias.apellidos = apellidoUsuario.text;
    Globales.personasAlergias.correo =correoUsuario.text;
    Globales.personasAlergias.password =contrasena.text;

            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  IndiceMasaCorporal()),
  );
            },
            child: const Text("Comenzar"))
      ]),
    );
  }
}
