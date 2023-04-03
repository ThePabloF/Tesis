import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pablo/bd/alergiasModel.dart';
import 'package:firebase_pablo/bd/globales.dart';
import 'package:firebase_pablo/services/metodosUtiles.dart';
import 'package:firebase_pablo/services/serviciosFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class ListTitleAlergias extends StatefulWidget {
  const ListTitleAlergias({super.key});

  @override
  State<ListTitleAlergias> createState() => _ListTitleAlergiasState();
}

class _ListTitleAlergiasState extends State<ListTitleAlergias> {
  List<AlergiasList> alergiasList = [];
   List <AlergiasList> alergiasSeleccionadas=[];
  MetodosUtiles metodos = MetodosUtiles();
    ServiciosFirebase servicios = ServiciosFirebase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    metodos.llenarListaFinal();
    alergiasList = MetodosUtiles.alergiasList;
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body:Column(children: [
         Expanded(
           child: ListView.builder(
            itemCount:alergiasList.length,
            itemBuilder: (BuildContext context, int index) {
              return ContactItem(
                  alergiasList[index].descripcion,
                alergiasList[index].disponibilidad,
                index,
              );
            }),
         ),

          ElevatedButton(onPressed: () async{
            await servicios.crearUsuario(Globales.personasAlergias, alergiasSeleccionadas);
           bool recibir=  await servicios.registrarUsuarioAutenticacion(
                  Globales.personasAlergias.correo!, Globales.personasAlergias.password!);

             if (recibir) {
                await servicios.crearUsuario(Globales.personasAlergias, alergiasSeleccionadas);
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Login(),
                  ),
                );
              } else {
                print("Error al crear cuenta");
              }
        
            

          }, child: const Text('Crear Cuenta'))
      ],)
    );
  }

  Widget ContactItem(
    String descripcion,
    bool disponibilidad,
    int index,
  ) {
    return ListTile(
      title: Text(
        descripcion,
        style: TextStyle(fontSize: 10),
      ),
      trailing: disponibilidad
          ? Icon(
              Icons.check_circle,
              size: 20,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              size: 20,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          alergiasList[index].disponibilidad =
              !alergiasList[index].disponibilidad;
          if (alergiasList[index].disponibilidad == true) {
            alergiasSeleccionadas.add(AlergiasList(index: index, descripcion: descripcion, disponibilidad: disponibilidad));
          } else if (alergiasList[index].disponibilidad == false) {
            alergiasSeleccionadas.removeWhere((element) =>
                element.descripcion ==
                alergiasList[index].descripcion);
          }


         // VariablesGlobales.arregloHerramientasLleno = selectedContacts;
        });
      },
    );
  }
}