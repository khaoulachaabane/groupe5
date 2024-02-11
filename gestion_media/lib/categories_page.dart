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
          if (category == 'Livres')
            BookItem(imagePath: 'assets/images/livres/allyourperfects.png', title: 'Livre 1'),
          if (category == 'Films') // Ajoutez ici des éléments spécifiques aux films
            Column(
              children: [
                BookItem(imagePath: 'assets/images/films/thehungergames.png', title: 'The Hunger Games'),
                BookItem(imagePath: 'assets/images/films/catchingfire.png', title: 'Catching Fire'),
                BookItem(imagePath: 'assets/images/films/mockingjay1.png', title: 'Mockingjay Pt.1'),
                BookItem(imagePath: 'assets/images/films/mockingjay2.png', title: 'Mockingjay Pt.2'),
              ],
            ),
          if (category != 'Livres' && category != 'Films')
            Center(child: Text('Aucun élément trouvé pour la catégorie: $category')),
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