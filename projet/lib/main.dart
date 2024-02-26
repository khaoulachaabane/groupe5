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
                  'https://picsum.photos/512',
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
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotationX = value;
              });
            },
          ),
          Text('Rotation Y: ${_rotationY.toStringAsFixed(2)}'),
          Slider(
            value: _rotationY,
            min: -pi,
            max: pi,
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
      if (_rotationX > pi) _rotationX -= 2 * pi;
      if (_rotationY > pi) _rotationY -= 2 * pi;
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
                  'https://picsum.photos/512',
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
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotationX = value;
              });
            },
          ),
          Text('Rotation Y: ${_rotationY.toStringAsFixed(2)}'),
          Slider(
            value: _rotationY,
            min: -pi,
            max: pi,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 4'),
      ),
      body: DisplayTileWidget(),
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

class Exercice5PartieB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5 - Partie B'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _buildPuzzlePieces(),
      ),
    );
  }

  List<Widget> _buildPuzzlePieces() {
    final List<Widget> pieces = [];
    final String imageURL = 'https://picsum.photos/512';
    final double imageSize = 512.0; // Taille de l'image
    final double pieceSize = imageSize / 3; // Taille d'une pièce de puzzle

    // Coordonnées des morceaux par rapport au centre (0, 0)
    final List<Offset> offsets = [
      Offset(-1, -1), Offset(0, -1), Offset(1, -1),
      Offset(-1, 0), Offset(0, 0), Offset(1, 0),
      Offset(-1, 1), Offset(0, 1), Offset(1, 1),
    ];

    for (int i = 0; i < 9; i++) {
      final int row = i ~/ 3;
      final int col = i % 3;

      final double offsetX = col * pieceSize;
      final double offsetY = row * pieceSize;

      final Widget piece = Container(
        margin: EdgeInsets.all(8),
        child: ClipRect(
          child: Align(
            alignment: Alignment(-offsets[i].dx, -offsets[i].dy),
            widthFactor: 1 / 3,
            heightFactor: 1 / 3,
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
              width: pieceSize,
              height: pieceSize,
            ),
          ),
        ),
      );

      pieces.add(piece);
    }

    return pieces;
  }
}





class DisplayTileWidget extends StatelessWidget {
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
              child: Tile.croppedImageTile(),
            ),
          ),
          Container(
            height: 200,
            child: Image.network(Tile.imageURL, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class Tile {
  static String imageURL = 'https://picsum.photos/512';
  static Alignment alignment = Alignment(0, 0);

  static Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Tile.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(Tile.imageURL),
          ),
        ),
      ),
    );
  }
}

