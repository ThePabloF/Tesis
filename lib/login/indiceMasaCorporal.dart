import 'package:firebase_pablo/bd/globales.dart';
import 'package:firebase_pablo/login/alergias.dart';
import 'package:flutter/material.dart';

class IndiceMasaCorporal extends StatefulWidget {
  @override
  _IndiceMasaCorporalState createState() => _IndiceMasaCorporalState();
}

class _IndiceMasaCorporalState extends State<IndiceMasaCorporal> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController sexo = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController actividad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: formUI(),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  String gender = 'hombre';

  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: sexo,
              decoration: InputDecoration(
                labelText: 'Sexo',
              ),
              validator: campoRequerido,
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: edad,
              decoration: new InputDecoration(
                labelText: 'Edad',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: campoRequerido,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: altura,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Altura',
              ),
              validator: campoRequerido,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: peso,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Peso',
              ),
              validator: campoRequerido,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: actividad,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Actividad',
              ),
              validator: campoRequerido,
            )),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: new EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Guardar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ))
      ],
    );
  }



  String? campoRequerido (String? value){

    if(value!.length==0){
      return "Este campo es requerido";
    }
    return null;
  }

  save() {
    if (keyForm.currentState!.validate()) {
      print("Sexo ${sexo.text}");
      print("Edad ${edad.text}");
      print("Altura ${altura.text}");
      print("Peso ${peso.text}");
      print("Actividad ${actividad.text}");
      keyForm.currentState!.reset();

      Globales.personasAlergias.indice = calcularIndice();
      Globales.personasAlergias.objetivo = 'bajar';
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Alergias()));
  }
  }

  double calcularIndice (){
    return 2045;
  }
}
