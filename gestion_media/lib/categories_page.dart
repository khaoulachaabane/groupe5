import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final String category;

  CategoriesPage(this.category);

  @override
  Widget build(BuildContext context) {
    // Logique de construction de la page des catégories
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégorie: $category'),
      ),
      body: Center(
        child: Text('Contenu de la catégorie: $category'),
      ),
    );
  }
}
