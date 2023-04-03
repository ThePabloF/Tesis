import 'package:firebase_pablo/bd/InformacionUsuarioModel.dart';
import 'package:firebase_pablo/bd/alergiasModel.dart';

class MetodosUtiles {
 

 static List<AlergiasList> alergiasList =[];

  //void llenarLista() {

    
   /* listadoAlergias.addAll({
      'gluten': 0,
    });
    listadoAlergias.addAll({'crustaceo': 0});
    listadoAlergias.addAll({'huevos': 0});
    listadoAlergias.addAll({
      'pescado': 0,
    });
    listadoAlergias.addAll({
      'cacahuetes': 0,
    });
    listadoAlergias.addAll({
      'lacteos': 0,
    });
    listadoAlergias.addAll({
      'apio': 0,
    });
    listadoAlergias.addAll({
      'mostaza': 0,
    });
    listadoAlergias.addAll({
      'sulfitos': 0,
    });
    listadoAlergias.addAll({
      'sesamo': 0,
    });
    listadoAlergias.addAll({
      'moluscos': 0,
    });
    listadoAlergias.addAll({
      'soja': 0,
    });
    listadoAlergias.addAll({
      'frutosSecos': 0,
    });
    listadoAlergias.addAll({
      'altramuz': 0,
    });
  }*/



 Map<String, int> compararAlergias( List<AlergiasList> informacion) {

    Map<String,int> respuesta = {};
  /*  for (String keyPrincipal in listadoAlergias.keys) {
      if (informacion.alergias!.containsKey(keyPrincipal)) {
        print("Contiene" + keyPrincipal);
        respuesta.addAll({
            keyPrincipal:1
        });
      } else {
        //  print("No contiene" +listadoAlergias.contains(informacion.alergias![key]).toString());
        print("no contien" + keyPrincipal);
        respuesta.addAll({
            keyPrincipal:0
        });
      }
    }*/

    informacion.forEach((element) {
      respuesta.addAll({
          element.descripcion:1
      });
    });

    return respuesta;
  }




  llenarListaFinal (){
    AlergiasList gluten  = AlergiasList(index: 0, descripcion: 'Gluten', disponibilidad: false);
   AlergiasList cructaceos  = AlergiasList(index: 1, descripcion: 'Crustaceo', disponibilidad: false);
   AlergiasList huevos  = AlergiasList(index: 2, descripcion: 'Huevos', disponibilidad: false);
   AlergiasList pescado  = AlergiasList(index: 3, descripcion: 'Pescado', disponibilidad: false);
    AlergiasList cacahuetes  = AlergiasList(index: 4, descripcion: 'Cacahuetes', disponibilidad: false);
   AlergiasList lacteos  = AlergiasList(index: 5, descripcion: 'Lacteos', disponibilidad: false);
   AlergiasList apio  = AlergiasList(index: 6, descripcion: 'Apio', disponibilidad: false);
   AlergiasList mostaza  = AlergiasList(index: 7, descripcion: 'Mostaza', disponibilidad: false);
   AlergiasList sulfitos  = AlergiasList(index: 8, descripcion: 'Sulfitos', disponibilidad: false);
   AlergiasList sesamo  = AlergiasList(index: 9, descripcion: 'Sesamo', disponibilidad: false);
   AlergiasList moluscos  = AlergiasList(index: 10, descripcion: 'Moluscos', disponibilidad: false);
   AlergiasList soja  = AlergiasList(index: 11, descripcion: 'Soja', disponibilidad: false);
   AlergiasList frutosSecos  = AlergiasList(index: 12, descripcion: 'Frutos Secos', disponibilidad: false);
   AlergiasList altramuz  = AlergiasList(index: 13, descripcion: 'Altramuz', disponibilidad: false);
    alergiasList.add(gluten);
    alergiasList.add(cructaceos);
     alergiasList.add(huevos);
    alergiasList.add(pescado);
    alergiasList.add(cacahuetes);
    alergiasList.add(lacteos);
    alergiasList.add(apio);
    alergiasList.add(mostaza);
    alergiasList.add(sulfitos);
    alergiasList.add(sesamo);
    alergiasList.add(moluscos);
    alergiasList.add(soja);
    alergiasList.add(frutosSecos);
    alergiasList.add(altramuz);
    print("La longitud es: " + alergiasList.length.toString());


  }

}