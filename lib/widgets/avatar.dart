import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
         padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 31, 49, 32),
      child: Column(children: [
        Container(       
          width: 150,
          height: 150,
          decoration: BoxDecoration(
               color: Colors.white,
            borderRadius:BorderRadius.circular(100),),
          child: const Image(image: AssetImage('assets/avatar.png'),fit: BoxFit.cover,)),
       Container(
          padding: const EdgeInsets.all(20),
          child:  Column(children: [
              Text('Hola Pablo', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Text('3 "E1"',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ]),
        )
    
      ],),
    );
  }
}