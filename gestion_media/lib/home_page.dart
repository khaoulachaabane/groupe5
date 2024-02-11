import 'package:flutter/material.dart';
import 'categories_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Livres'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage('Livres')),
              );
            },
          ),
          ListTile(
            title: Text('Films'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage('Films')),
              );
            },
            // Ajoutez des tuiles pour les autres catégories ici
          ),
        ],
      ),
    );
  }
}



