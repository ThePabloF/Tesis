class AlmacenDatos {

  static Map<String, dynamic> datosAplicativo ={};


  Map<String, dynamic> cargarInformacion (String llave, dynamic valor){

        datosAplicativo.addAll(
          {
            llave:valor
          }
        );

      return datosAplicativo;
  }

}