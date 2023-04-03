import 'package:flutter/material.dart';

class ProductsSlider extends StatelessWidget {
   ProductsSlider({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _ImagenProducto(index),
            ),
          )
        ],
      ),
    );
  }
}

class _ImagenProducto extends StatelessWidget {

  int index;
  _ImagenProducto( this.index );

  @override
  Widget build(BuildContext context) {
      List<String> images = [
 "https://raw.githubusercontent.com/ThePabloF/ImagenesBar/main/chifles.jpeg",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/chifles_dulces.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/cubano.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/donas.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/ensalada_frutas.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/fresas_yogurt.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/helado_chocolate.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/helado_fresa.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/hotdog.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/mousse_de_chocolate.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/muffin_chocolate.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/pastel_chocolate.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/salchipapa.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/sanduche_at%C3%BAn.jpeg?raw=true",
 "https://github.com/ThePabloF/ImagenesBar/blob/main/sanduche_carne.jpeg?raw=true"

];

    return  SingleChildScrollView(
      child: Container(
        width: 150,
        height: 200,
        color: Colors.green,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
   
              Container(
                   child:
                         FadeInImage(
                            image: NetworkImage(images[index]),
                            placeholder:
                                const AssetImage('assets/no-image.jpg'),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/no-image.jpg',
                                  fit: BoxFit.fitWidth);
                            },
                            fit: BoxFit.fitWidth,
                          ),
              ),
            Text(
              'Top lugares que luisito no ha visitado'
            )
            
          
           
            
           ],
          ),
        ),
      ),
    );
  }
}
