import 'package:firebase_pablo/bd/InformacionUsuarioModel.dart';

class PersonasAlergiasModelo {

  Map<String, int> ?alergias;
  String ?apellidos;
  String ?nombres;
  String ?correo;
  double ?indice;
  String ?objetivo;
  String ?password;

  PersonasAlergiasModelo(
      { this.alergias,
       this.nombres,
       this.apellidos,
       this.correo,
       this.objetivo,
       this.indice,
       this.password
    });



}
