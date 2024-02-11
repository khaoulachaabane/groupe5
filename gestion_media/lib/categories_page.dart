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
          BookItem(imagePath: 'assets/images/livres/allyourperfects.png', title: 'Livre 1'),
        ],.
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(widget.imagePath),
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
              color: liked ? Colors.red : null,
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}