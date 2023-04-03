import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_pablo/pages/pages.dart';
import 'package:firebase_pablo/preferences/preferencias.dart';

import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is dthe root of your application.
  @override
  Widget build(BuildContext context) {

    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'comida',
      initialRoute:'home',
      routes: {
      'home':(context) =>  Login(),
      'start':(context) => HomePage(),
      'detalles':(context) => detalles()
      },
  
    );
  }
}
