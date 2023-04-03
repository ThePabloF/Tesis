import 'package:firebase_pablo/bd/productosDos.dart';
import 'package:flutter/material.dart';

class ProductosSearchDelegate extends SearchDelegate{

PrincipalProductos principal = PrincipalProductos();


  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar Producto";

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
   return [
    IconButton(onPressed: () {
      query="";
    }, icon: Icon(Icons.clear))
   ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   return IconButton(onPressed: (){
    close(context, null);
   }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<ProductoDos> productosTotales = principal.productosTotales();
    // TODO: implement buildSuggestions
        if(query.isEmpty){
          return ListView.builder(
          itemCount:productosTotales.length,
          itemBuilder: (context, index) {
            return Container(

              child:Column(
              children: [
                Row(children: [
              
                   Container(
                    width: 75,
                 
                     child: FadeInImage(
                                 placeholder:AssetImage('assets/no-image.jpg'),
                                 image: NetworkImage(productosTotales[index].url),
                                 fit: BoxFit.cover,
                               ),
                   ),
              
                Text(productosTotales[index].nombre)
                ],),
                SizedBox(height: 50,),
                Column(children: [
                  Text("Búsquedas Recientes"),
                  ElevatedButton(onPressed: (){
                    query="manzana";
                  }, child: Text("Manzanas"))
                ],)
              ],
              )
            );
          },
        );
        }



List<ProductoDos> productosBusqueda = principal.obtenerProductos(query);


        return ListView.builder(
          itemCount:productosBusqueda.length,
          itemBuilder: (context, index) {
            return Container(

              child:Row(children: [

                 Container(
                  width: 75,
               
                   child: FadeInImage(
                               placeholder:AssetImage('assets/no-image.jpg'),
                               image: NetworkImage(productosBusqueda[index].url),
                               fit: BoxFit.cover,
                             ),
                 ),

              Text(productosBusqueda[index].nombre)
              ],)
            );
          },
        );
  }


}