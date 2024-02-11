import 'package:flutter/material.dart';
import 'books_details_page.dart';

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
            BookItem(
              imagePath: 'assets/images/livres/allyourperfects.png',
              title: 'Livre 1',
              description: 'Description du Livre 1...',
            ),
          if (category == 'Livres')
            BookItem(
              imagePath: 'assets/images/livres/atoutjamais.png',
              title: 'Livre 2',
              description: 'Description du Livre 2...',
            ),
          if (category == 'Films')
            Column(
              children: [
                BookItem(
                  imagePath: 'assets/images/films/thehungergames.png',
                  title: 'The Hunger Games',
                  description: 'Description de The Hunger Games...',
                ),
                BookItem(
                  imagePath: 'assets/images/films/catchingfire.png',
                  title: 'Catching Fire',
                  description: 'Description de Catching Fire...',
                ),
                BookItem(
                  imagePath: 'assets/images/films/mockingjay1.png',
                  title: 'Mockingjay Pt.1',
                  description: 'Description de Mockingjay Pt.1...',
                ),
                BookItem(
                  imagePath: 'assets/images/films/mockingjay2.png',
                  title: 'Mockingjay Pt.2',
                  description: 'Description de Mockingjay Pt.2...',
                ),
              ],
            ),
          if (category != 'Livres' && category != 'Films')
            Center(
              child: Text('Aucun élément trouvé pour la catégorie: $category'),
            ),
        ],
      ),
    );
  }
}

class BookItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const BookItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsPage(
                title: widget.title,
                description: widget.description,
              ),
            ),
          );
        },
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
      ),
    );
  }
}
