import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transformation d\'image'),
        ),
        body: Menu(),
      ),
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;

  Tile(this.imageURL, this.alignment);

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}

class DisplayTileWidget extends StatelessWidget {
  final Tile tile;

  DisplayTileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: tile.croppedImageTile(),
            ),
          ),
          Container(
            height: 200,
            child: Image.network(tile.imageURL, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text('Exercice 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice1()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 2 - Partie A'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice2PartieA()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 2 - Partie B'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice2PartieB()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 4'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice4()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5 - Partie A'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice5PartieA()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5 - Partie B'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice5PartieB()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5 - Partie C'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercice5C()),
              );
            },
          ),
        ),
      ],
    );
  }
}


class Exercice1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://picsum.photos/512',
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}

class Exercice2PartieA extends StatefulWidget {
  @override
  _Exercice2PartieAState createState() => _Exercice2PartieAState();
}

class _Exercice2PartieAState extends State<Exercice2PartieA> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scaleFactor = 1.0;
  bool _isMirrored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 2 Partie A'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isMirrored = !_isMirrored;
              });
            },
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Transform(
                transform: Matrix4.identity()
                  ..rotateX(_rotationX)
                  ..rotateY(_rotationY)
                  ..scale(_scaleFactor)
                  ..scale(_isMirrored ? -1.0 : 1.0),
                alignment: FractionalOffset.center,
                child: Image.network(
                  'https://picsum.photos/513',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('Rotation X: ${_rotationX.toStringAsFixed(2)}'),
          Slider(
            value: _rotationX,
            min: -3.14,
            max: 3.14,
            onChanged: (value) {
              setState(() {
                _rotationX = value;
              });
            },
          ),
          Text('Rotation Y: ${_rotationY.toStringAsFixed(2)}'),
          Slider(
            value: _rotationY,
            min: -3.14,
            max: 3.14,
            onChanged: (value) {
              setState(() {
                _rotationY = value;
              });
            },
          ),
          Text('Scale: ${_scaleFactor.toStringAsFixed(2)}'),
          Slider(
            value: _scaleFactor,
            min: 0.1,
            max: 2.0,
            onChanged: (value) {
              setState(() {
                _scaleFactor = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Exercice2PartieB extends StatefulWidget {
  @override
  _Exercice2PartieBState createState() => _Exercice2PartieBState();
}

class _Exercice2PartieBState extends State<Exercice2PartieB> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scaleFactor = 1.0;
  bool _isAnimating = true;
  bool _isMirrored = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startAnimation() {
    const d = const Duration(milliseconds: 50);
    _timer = Timer.periodic(d, animate);
  }

  void stopAnimation() {
    _timer.cancel();
    setState(() {
      _isAnimating = false;
    });
  }

  void toggleAnimation() {
    if (_isAnimating) {
      stopAnimation();
    } else {
      startAnimation();
      setState(() {
        _isAnimating = true;
      });
    }
  }

  void animate(Timer t) {
    setState(() {
      _rotationX += 0.05;
      _rotationY += 0.05;
      if (_rotationX > 3.14) _rotationX -= 2 * 3.14;
      if (_rotationY > 3.14) _rotationY -= 2 * 3.14;
      _scaleFactor = 0.5 + 0.5 * (1 + sin(_rotationX + _rotationY));
    });
  }

  void toggleMirrorEffect() {
    setState(() {
      _isMirrored = !_isMirrored;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 2 Partie B'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: toggleMirrorEffect,
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Transform(
                transform: Matrix4.identity()
                  ..rotateX(_rotationX)
                  ..rotateY(_rotationY)
                  ..scale(_scaleFactor)
                  ..translate(_isMirrored ? 200.0 : 0.0),
                alignment: FractionalOffset.center,
                child: Image.network(
                  'https://picsum.photos/514',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: toggleAnimation,
            child: Text(_isAnimating ? 'Stop Animation' : 'Start Animation'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: toggleMirrorEffect,
            child: Text(_isMirrored ? 'Disable Mirror' : 'Enable Mirror'),
          ),
          SizedBox(height: 10),
          Text('Rotation X: ${_rotationX.toStringAsFixed(2)}'),
          Slider(
            value: _rotationX,
            min: -3.14,
            max: 3.14,
            onChanged: (value) {
              setState(() {
                _rotationX = value;
              });
            },
          ),
          Text('Rotation Y: ${_rotationY.toStringAsFixed(2)}'),
          Slider(
            value: _rotationY,
            min: -3.14,
            max: 3.14,
            onChanged: (value) {
              setState(() {
                _rotationY = value;
              });
            },
          ),
          Text('Scale: ${_scaleFactor.toStringAsFixed(2)}'),
          Slider(
            value: _scaleFactor,
            min: 0.1,
            max: 2.0,
            onChanged: (value) {
              setState(() {
                _scaleFactor = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Exercice4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Créez une instance de Tile avec des valeurs d'exemple
    final Tile exampleTile = Tile(
      'https://picsum.photos/515',
      Alignment(0, 0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 4'),
      ),
      // Fournissez l'instance de Tile à DisplayTileWidget
      body: DisplayTileWidget(exampleTile),
    );
  }
}

class Exercice5PartieA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5 - Partie A'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            margin: EdgeInsets.all(8),
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'Tile $index',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class Exercice5PartieB extends StatefulWidget {
  const Exercice5PartieB({Key? key}) : super(key: key);

  @override
  _Exercice5PartieBState createState() => _Exercice5PartieBState();
}

class _Exercice5PartieBState extends State<Exercice5PartieB> {
  int _crossAxisCount = 3; // Nombre initial de divisions
  final String imageURL = 'https://picsum.photos/516'; // URL de l'image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 5 - Partie B'),
      ),
      body: Column(
        children: [
          Slider(
            value: _crossAxisCount.toDouble(),
            min: 3,
            max: 10,
            divisions: 7, // Nombre de divisions du curseur
            label: _crossAxisCount.round().toString(),
            onChanged: (value) {
              setState(() {
                _crossAxisCount = value.toInt();
              });
            },
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              crossAxisCount: _crossAxisCount,
              children: generateAllTiles(_crossAxisCount),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateAllTiles(int size) {
    return List<Widget>.generate(size * size, (index) => createTileWidget(index));
  }

 Widget createTileWidget(int index) {
  final double xOffset = (index % _crossAxisCount) / (_crossAxisCount - 1);
  final double yOffset = (index ~/ _crossAxisCount) / (_crossAxisCount - 1);
  final double xAlignment = (xOffset * 2 - 1).clamp(-1.0, 1.0);
  final double yAlignment = (yOffset * 2 - 1).clamp(-1.0, 1.0);

  return InkWell(
    child: Container(
      color: Colors.blue, // Couleur de fond de chaque conteneur
      child: Center(
        child: FittedBox(
          fit: BoxFit.cover,
          child: ClipRect(
            child: Align(
              alignment: Alignment(xAlignment, yAlignment),
              widthFactor: 1.0 / _crossAxisCount,
              heightFactor: 1.0 / _crossAxisCount,

              child: Image.network(imageURL),
            ),
          ),
        ),
      ),
    ),
    onTap: () {
      // Action à effectuer lorsque la tuile est tapée
    },
  );
}
}

class Exercice5PartieC extends StatefulWidget {
  @override
  _Exercice5PartieCState createState() => _Exercice5PartieCState();
}

class _Exercice5PartieCState extends State<Exercice5PartieC> {
  double _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 5 - Partie C'),
      ),
      body: Column(
        children: [
          Slider(
            min: 3,
            max: 10,
            divisions: 7,
            value: _crossAxisCount,
            label: _crossAxisCount.toInt().toString(),
            onChanged: (value) {
              setState(() {
                _crossAxisCount = value;
              });
            },
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              crossAxisCount: _crossAxisCount.toInt(),
              children: generateAllTiles(_crossAxisCount.toInt()),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateAllTiles(int size) {
    return List<Widget>.generate(
      size * size,
      (index) => createTileWidget(index),
    );
  }

  Widget createTileWidget(int index) {
    final double xOffset = (index % _crossAxisCount) / (_crossAxisCount - 1);
    final double yOffset = (index ~/ _crossAxisCount) / (_crossAxisCount - 1);
    final double xAlignment = (xOffset * 2 - 1).clamp(-1.0, 1.0);
    final double yAlignment = (yOffset * 2 - 1).clamp(-1.0, 1.0);

    return InkWell(
      child: Container(
        color: Colors.blue, // Couleur de fond de chaque conteneur
        child: Center(
          child: FittedBox(
            fit: BoxFit.cover,
            child: ClipRect(
              child: Align(
                alignment: Alignment(xAlignment, yAlignment),
                widthFactor: 1.0 / _crossAxisCount,
                heightFactor: 1.0 / _crossAxisCount,
                child: Image.network('https://picsum.photos/512'),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        // Action à effectuer lorsque la tuile est tapée
      },
    );
  }
}
