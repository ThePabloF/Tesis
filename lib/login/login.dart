import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pablo/login/registro.dart';
import 'package:firebase_pablo/pages/HomePage.dart';
import 'package:firebase_pablo/widgets/popUp.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                email.text = "";
                password.text = "";
                return HomePage();
              } else {
                return localTienda(context);
              }
            }),
      ),
    );
  }

  Future loguearse(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => popUpMalLogueo(context),
      );
    }
  }

  ListView localTienda(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const Text('login',
                style:
                    TextStyle(fontFamily: 'SSignikaNegative', fontSize: 50.0)),
            const Text(
              'Bar de Alimentos',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              width: 160.0,
              height: 15.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            TextField(
              enableInteractiveSelection: false,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              controller: email,
              decoration: InputDecoration(
                hintText: 'correo@mail.com',
                labelText: 'Correo',
                suffixIcon: const Icon(Icons.verified_user),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            const Divider(
              height: 18.0,
            ),
            TextField(
              enableInteractiveSelection: false,
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                hintText: 'contraseña',
                labelText: 'Contraseña',
                suffixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            const Divider(
              height: 18.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.grey),
              onPressed: () => loguearse(context),
              child: const Text(
                'Iniciar Sesion',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistroUsuario()),
                );
              },
              child: const Text(
                'Registrarse',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
