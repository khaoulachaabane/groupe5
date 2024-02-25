import 'package:flutter/material.dart';

class FilmDetailsPage extends StatelessWidget {
  final String title;
  final String description;

  FilmDetailsPage({required this.title, required this.description});

  // Liste des films avec leurs détails
  List<Map<String, String>> films = [
    {
      'title': 'The Hunger Games',
      'description': 'Description de The Hunger Games',
      'author': 'Suzanne Collins',
      'country': 'États-Unis',
      'genre': 'Science-fiction, Dystopie',
      'language': 'Anglais',
      'releaseDate': '2012',
      'location': 'Panem',
    },
    {
      'title': 'Catching Fire',
      'description': 'Description de Catching Fire',
      'author': 'Suzanne Collins',
      'country': 'États-Unis',
      'genre': 'Science-fiction, Dystopie',
      'language': 'Anglais',
      'releaseDate': '2013',
      'location': 'Panem',
    },
    {
      'title': 'Mockingjay Pt.1',
      'description': 'Description de Mockingjay Pt.1',
      'author': 'Suzanne Collins',
      'country': 'États-Unis',
      'genre': 'Science-fiction, Dystopie',
      'language': 'Anglais',
      'releaseDate': '2014',
      'location': 'District 13',
    },
    {
      'title': 'Mockingjay Pt.2',
      'description': 'Description de Mockingjay Pt.2',
      'author': 'Suzanne Collins',
      'country': 'États-Unis',
      'genre': 'Science-fiction, Dystopie',
      'language': 'Anglais',
      'releaseDate': '2015',
      'location': 'Capitole',
    },
    // Ajoutez les détails des deux autres films de la même manière
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    // Trouvez les détails du film actuel dans la liste
    Map<String, String>? currentFilm;
    for (var film in films) {
      if (film['title'] == title) {
        currentFilm = film;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/films/${title.toLowerCase().replaceAll(" ", "")}.png', height: 200.0, width: 200.0),
            SizedBox(height: 16.0),
            Text('Détails du film:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(2.0),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('Auteur:')),
                    TableCell(child: Text(currentFilm?['author'] ?? '')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Pays:')),
                    TableCell(child: Text(currentFilm?['country'] ?? '')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Genre:')),
                    TableCell(child: Text(currentFilm?['genre'] ?? '')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Langue:')),
                    TableCell(child: Text(currentFilm?['language'] ?? '')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Date de parution:')),
                    TableCell(child: Text(currentFilm?['releaseDate'] ?? '')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Lieu:')),
                    TableCell(child: Text(currentFilm?['location'] ?? '')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(currentFilm?['description'] ?? ''),
          ],
        ),
      ),
    );
  }
}
