import 'package:flutter/material.dart';
import 'books_details_page.dart';
import 'films_details_page.dart'; 

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
              title: 'all your perfects',
              description: 'All Your Perfects est un roman émotionnellement captivant écrit par l auteure à succès Colleen Hoover. Plongez dans l histoire de Quinn et Graham, un couple apparemment parfait dont le mariage est mis à l épreuve par l infertilité et les défis qui en découlent. Alternant entre le passé et le présent, le récit explore les hauts et les bas de leur relation, ainsi que les sacrifices et les compromis nécessaires pour maintenir leur amour vivant. Avec une écriture émouvante et des personnages profondément nuancés, "All Your Perfects" est une exploration poignante de l amour, du pardon et de la résilience face à l adversité. Ce roman poignant vous transportera dans un voyage émotionnel inoubliable qui vous fera rire, pleurer et réfléchir longtemps après avoir tourné la dernière page.',
            ),
          if (category == 'Livres')
            BookItem(
              imagePath: 'assets/images/livres/la-tresse.png',
              title: 'La tresse',
              description: 'La Tresse est un roman émouvant de Laetitia Colombani qui tisse ensemble les histoires de trois femmes de continents différents, unies par un fil invisible. Smita, en Inde, lutte contre la discrimination des castes pour offrir un avenir meilleur à sa fille. En Sicile, Giulia se bat pour sauver l atelier de perruques familial après un tragique accident. Enfin, Sarah, avocate à Montréal, doit concilier sa carrière exigeante avec son rôle de mère célibataire. Alors que leurs destins se croisent de manière inattendue, elles découvrent la force du lien qui les unit malgré les kilomètres qui les séparent. "La Tresse" est une histoire inspirante sur la résilience, la solidarité féminine et le pouvoir de surmonter les obstacles. Avec une écriture captivante et des personnages riches en nuances, ce roman nous transporte dans un voyage émotionnel poignant qui nous rappelle que, quel que soit notre origine, nous partageons tous les mêmes désirs de liberté, d amour et d espoir.',
            ),  
          if (category == 'Livres')
            BookItem(
              imagePath: 'assets/images/livres/atoutjamais.png',
              title: 'a tout jamais',
              description: 'À tout jamais est un roman de Colleen Hoover qui explore les profondeurs de l amour, du pardon et de la guérison à travers une histoire émouvante et captivante. L histoire suit la vie de Sydney Blake, une jeune femme qui lutte avec les cicatrices émotionnelles de son passé tumultueux. Après avoir été témoin d un événement tragique dans son enfance, Sydney cherche désespérément à échapper à son traumatisme en construisant des murs autour de son cœur. Mais lorsque le charismatique Ridge Lawson entre dans sa vie, tout change. Malgré leur attirance instantanée, Ridge est déjà en couple avec Maggie, une situation qui complique encore plus les choses. Alors que Sydney et Ridge luttent contre leurs sentiments interdits, ils se retrouvent inexorablement attirés l un vers l autre. Mais comment peuvent-ils trouver le bonheur lorsque leur amour semble être condamné dès le départ ? "À tout jamais" est une exploration émouvante des défis de l amour, de la loyauté et de la persévérance, et de la façon dont même les plus grandes cicatrices peuvent guérir avec le temps et la compréhension.',
            ),
          if (category == 'Films')
            Column(
              children: [
                FilmItem(
                  imagePath: 'assets/images/films/thehungergames.png',
                  title: 'The Hunger Games',
                  description: 'Description de The Hunger Games...',
                ),
                FilmItem(
                  imagePath: 'assets/images/films/catchingfire.png',
                  title: 'Catching Fire',
                  description: 'Description de Catching Fire...',
                ),
                FilmItem(
                  imagePath: 'assets/images/films/mockingjay1.png',
                  title: 'Mockingjay Pt.1',
                  description: 'Description de Mockingjay Pt.1...',
                ),
                FilmItem(
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
                // Ajout de l'image à passer à la page des détails
                imageAssetPath: widget.imagePath,
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

class FilmItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const FilmItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  _FilmItemState createState() => _FilmItemState();
}

class _FilmItemState extends State<FilmItem> {
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
              builder: (context) => FilmDetailsPage(
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
