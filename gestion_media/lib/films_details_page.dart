import 'package:flutter/material.dart';

class FilmDetailsPage extends StatelessWidget {
  final String title;
  final String description;

  FilmDetailsPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/films/thehungergames.png', height: 200.0, width: 200.0), // Ajout de l'image
            SizedBox(height: 16.0),
            Text('Détails du film:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1.5), // Ajustez la largeur des colonnes selon vos besoins
                1: FlexColumnWidth(2.0),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('Auteur:')),
                    TableCell(child: Text('Suzanne Collins')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Pays:')),
                    TableCell(child: Text('États-Unis')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Genre:')),
                    TableCell(child: Text('Science-fiction, Dystopie')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Langue:')),
                    TableCell(child: Text('Anglais')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Date de parution:')),
                    TableCell(child: Text('2012')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Lieu:')),
                    TableCell(child: Text('Panem')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(description),
          ],
        ),
      ),
    );
  }
}


