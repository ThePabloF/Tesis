import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
   CardSwiper({super.key});
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
  @override
  Widget build(BuildContext context) {
  
    
    final size= MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: size.height*0.2,
      


      child: Swiper(
   
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: ( _ , int indx){
          
          return GestureDetector(

           onTap: () => Navigator.pushNamed(context, 'detalles',arguments: 'details'),
            child: ClipRRect(

              borderRadius: BorderRadius.circular(20),
              child:FadeInImage(
                 image:  NetworkImage(images[indx]),
                 placeholder:
                     const AssetImage('assets/giphy.gif'),
                 imageErrorBuilder: (context, error, stackTrace) {
                   return Image.asset('assets/no-image.jpg',
                       fit: BoxFit.fitWidth);
                 },
                 fit: BoxFit.fitWidth,
               ),
             
            ),
          );
        
        }
      
      
      ),
    

    );
  }
}