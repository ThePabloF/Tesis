import 'package:shared_preferences/shared_preferences.dart';

class Preferences 
{

  static late SharedPreferences _prefs;
  
  static late String _estructura =''; 
  

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String  get estructura {
    return _prefs.getString('estructura') ?? _estructura;
  }

  static set estructura (String estructura){
    _estructura= estructura;
    _prefs.setString('estructura', estructura);
  }


   
 
}



class EstructaShared {
  String nombres;
  String apellidos;
  String correo;
  AlergiasEstructura alergias; 
  

  EstructaShared(
      {required this.nombres,
      required this.apellidos,
      required this.correo,
     required this.alergias
     });


      Map<String, dynamic> toJson(EstructaShared estructaShared) {
    return {
      "nombres":EstructaShared,
    
      
    };
  }
}


class AlergiasEstructura{

  String nombre;
  int activo;
  AlergiasEstructura({
      required this.nombre,
      required this.activo
  });
}