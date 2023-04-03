
import 'package:firebase_pablo/pages/HomePage.dart';
import 'package:flutter/material.dart';


void main() => runApp(detalles());

class detalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailsScreen(),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Información'),
        actions: [
          ElevatedButton(
              child: const Icon(Icons.keyboard_return_outlined), //icono
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage())),
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child:Container(
                child: Image.network("https://raw.githubusercontent.com/ThePabloF/ImagenesBar/main/chifles.jpeg"),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Nombre',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Descripción',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Precio: \$0.50',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}