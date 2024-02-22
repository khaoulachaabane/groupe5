import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemple d\'affichage d\'une image'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image chargée depuis l'URL avec la taille spécifiée
                Image.network(
                  'https://picsum.photos/512/1024',
                  fit: BoxFit.contain, // Ajustement de la taille de l'image
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
