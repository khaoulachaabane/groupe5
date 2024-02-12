import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageAssetPath; // Ajout du nouveau paramètre

  const BookDetailsPage({
    required this.title,
    required this.description,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(imageAssetPath), // Utilisation de l'image
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
