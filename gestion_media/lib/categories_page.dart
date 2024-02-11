import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final String category;

  CategoriesPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégorie: $category'),
      ),
      body: ListView(
        children: [
          BookItem(imagePath: 'assets/allyourperfects.png', title: 'Livre 1'),
          BookItem(imagePath: 'assets/livres/allyourperfects.png', title: 'Livre 1'),
          
        ],
      ),
    );
  }
}

class BookItem extends StatefulWidget {
  final String imagePath;
  final String title;

  const BookItem({required this.imagePath, required this.title});

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool liked = false;


