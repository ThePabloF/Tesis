import 'package:flutter/material.dart';



class DrawerMenuLateral extends StatelessWidget {
  const DrawerMenuLateral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration( 
              color: Colors.amber,
            ),
            child: Column(
              children: [
                Expanded(child: 
                Image.asset('assets/logo.png'),
                ),
                const SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Información'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ayuda'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.coffee),
            title: const Text('Dieta'), 
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}