import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pablo/search/search_delegate.dart';
import 'package:firebase_pablo/services/almacenDatos.dart';
import 'package:firebase_pablo/services/serviciosFirebase.dart';
import 'package:firebase_pablo/widgets/avatar.dart';
import 'package:firebase_pablo/widgets/drawerMenuLateral.dart';
import 'package:firebase_pablo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData.light().copyWith();

    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          actions: [
            ElevatedButton(
                child: const Icon(Icons.search_off_outlined),
                onPressed: () => showSearch(
                    context: context, delegate: ProductosSearchDelegate())),          
            ElevatedButton(
              child: const Icon(Icons.exit_to_app), //icono
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
        drawer: const DrawerMenuLateral(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              const Positioned(
                top: 10,
                child: Avatar(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.9,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            child: const Text(
                              "Recomendados",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                           CardSwiper(),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            child: const Text(
                              "Categorias",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                           ProductsSlider(),
                        ],
                      ),
                    ])),
              ),
            ],
          ),
        ));
  }
}
