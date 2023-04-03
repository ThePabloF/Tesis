import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pablo/bd/PersonaAlergiasModelo.dart';
import 'package:firebase_pablo/login/alergias.dart';
import 'package:firebase_pablo/services/almacenDatos.dart';
import 'package:firebase_pablo/services/metodosUtiles.dart';

import '../bd/InformacionUsuarioModel.dart';
import '../bd/alergiasModel.dart';

class ServiciosFirebase {
  final firebase = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  AlmacenDatos almaneces = AlmacenDatos();
  InformacionUsuario info = InformacionUsuario();
    List<InformacionUsuario> usuarios = []; //Lista de Usuarios
    late  InformacionUsuario infoUser; //Objeto vacio usado para cargar informacion y borrar al instante, es como un contenedor 

  registrarUsuarioFirebase(String nombre, String correo, String alias) async {
    try {
      await firebase
          .collection('Users')
          .doc()
          .set({"nombre": nombre, "correo": correo, "alias": alias});
    } catch (e) {
      print(e);
    }
  }

  Future<bool> registrarUsuarioAutenticacion(
      String correo, String password) async {
    AlmacenDatos almacen = AlmacenDatos();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: correo, password: password);

      almacen.cargarInformacion('datosSesion', {'correo':correo});

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> inforPrimerRegistro() async {
    final auxiliar =
        FirebaseFirestore.instance.collection('UsuarioCompleto').doc();
    try {
      await auxiliar.set(crearCuerpo('', ''));
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> crearCuerpo(String llave, dynamic valor) {
    Map<String, int> alergias = {'Crustaceos': 1, 'Gluten': 1, 'Huevos': 1};

    Map<String, dynamic> datosCompletos = {
      'nombres': 'Davicho Fernando',
      'apellidos': 'Feijo Baculima',
      'correo': 'correo4@correo.com',
      'Alergias': alergias
    };

    return datosCompletos;
  }


 Future crearUsuario(PersonasAlergiasModelo informacionUsuario,  List<AlergiasList> alergiasSeleccionadas) async{
    MetodosUtiles metodos = MetodosUtiles();
    CollectionReference usuarios = FirebaseFirestore.instance.collection('UsuarioCompleto');

       // metodos.llenarLista();
       
        
        usuarios.doc(informacionUsuario.correo)
          .set({
            'nombres':informacionUsuario.nombres,
            'apellidos':informacionUsuario.apellidos,
            'correo':informacionUsuario.correo,
            'indice':informacionUsuario.indice,
            'objetivo':informacionUsuario.objetivo,
           'alergias':  metodos.compararAlergias(alergiasSeleccionadas)
          }).then((value) => print("Se agrego correctamente"))
          .catchError((error)=> {
              print(error)
          });
    /*  */

  }


  Future<List<InformacionUsuario>> getUsuarios() async{

      usuarios.clear();
      CollectionReference collectionReference = firebase.collection('UsuarioCompleto'); //Extrae la coleccion que requerimos
      QuerySnapshot querySnapshot = await collectionReference.get(); //se ejecuta la consulta y se guarda el resultado en una variable querysnapshot
 
  //For each para sacar los documentos que vienen en querysnapshot
     querySnapshot.docs.forEach((element) {
        //Se guarda en el contenedor: Usamos el metodo fromJson del modelo y le pasamos como parametro
        // la data en la posicion que este del foreach y le convierte a map string
         infoUser= InformacionUsuario.fromJson(element.data() as Map<String,dynamic>);
        usuarios.add(infoUser);//agregamos a la lista de usuarios
      });
      //retornamos la lista para ser usada
    return usuarios;
  }

    Future<InformacionUsuario> getUsuario() async{

        
       firebase.collection('UsuarioCompleto').doc('S7LNDottwNCMfmZPzi7Q').get().then((DocumentSnapshot doc) {
        infoUser= InformacionUsuario.fromJson( doc.data() as Map<String,dynamic>);
       },
       onError: (e)=>print("Ocurrio un error") );

     
     
    return infoUser;
  }
}
