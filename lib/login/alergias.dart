import 'package:firebase_pablo/bd/InformacionUsuarioModel.dart';
import 'package:firebase_pablo/preferences/preferencias.dart';
import 'package:firebase_pablo/services/metodosUtiles.dart';
import 'package:firebase_pablo/services/serviciosFirebase.dart';
import 'package:firebase_pablo/widgets/listTitleWidgets.dart';
import 'package:flutter/material.dart';

import '../bd/alergiasModel.dart';


/*const List<Widget> vegetables = <Widget>[
  Text('Gluten'),
  Text('Antioxidantes'),
  Text('Manzanas'),
    Text('Ratas'),
  Text('Teclas'),


];

 List<AlergiasModel> alergias =<AlergiasModel>[

    AlergiasModel(idProducto: 0, nombre: "Gluten", estado: 0, activo: false),
    AlergiasModel(idProducto: 1, nombre: "Antioxidantes", estado: 0, activo: false),
    AlergiasModel(idProducto: 2, nombre: "Manzanas", estado: 0, activo: false),
    AlergiasModel(idProducto: 3, nombre: "Ratas", estado: 0, activo: false),
    AlergiasModel(idProducto: 4, nombre: "Teclas", estado: 0, activo: false)


];





class SeleccionAlergias extends StatefulWidget {
  const SeleccionAlergias({super.key, required this.title});

  final String title;

  @override
  State<SeleccionAlergias> createState() => _SeleccionAlergiasState();
}

class _SeleccionAlergiasState extends State<SeleccionAlergias> {

  final List<bool> _selectedVegetables = <bool>[false, false, false, false, false];

  bool vertical = false;
  ServiciosFirebase servicios = ServiciosFirebase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ToggleButtons with a single selection.
            
              Text('Multi-select', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  // All buttons are selectable.
                  setState(() {
                    _selectedVegetables[index] = !_selectedVegetables[index];
                    alergias[index].activo = !alergias[index].activo;
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.green[700],
                selectedColor: Colors.white,
                fillColor: Colors.green[200],
                color: Colors.green[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedVegetables,
                children: vegetables,
              ),
              const SizedBox(height: 20),

              ElevatedButton(onPressed: () async {
                 
             for (var i = 0; i < alergias.length; i++) {
              if(alergias[i].activo==true){
                // print(alergias[i].nombre);
              }
             }
/*List<InformacionUsuario> respuesta = await servicios.getUsuarios();
                for (var element in respuesta) {
                  print(element.nombres);
                }
print("********");*/
        InformacionUsuario respuestaUsuario = await servicios.getUsuario();
           
          respuestaUsuario.indice='2048';
          respuestaUsuario.objetivo='bajar';
          respuestaUsuario.alergias!.addAll({
                  'frutosSecos':0,
          });
            await servicios.crearUsuario(respuestaUsuario);
              }, child: Text("Mostrar valores"))
              // ToggleButtons with icons only.
             
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            // When the button is pressed, ToggleButtons direction is changed.
            vertical = !vertical;
          });
        },
        icon: const Icon(Icons.screen_rotation_outlined),
        label: Text(vertical ? 'Horizontal' : 'Vertical'),
      ),
    );
  }
}*/



class Alergias extends StatefulWidget {
  const Alergias({super.key});

  @override
  State<Alergias> createState() => _AlergiasState();
}

class _AlergiasState extends State<Alergias> {
  var numeros = [1,2,3,4,5];
  MetodosUtiles metodos = MetodosUtiles();
  @override
  void initState() {
    super.initState();

  }

  Color colorInical = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
                ListTitleAlergias()
                );
  }
}
