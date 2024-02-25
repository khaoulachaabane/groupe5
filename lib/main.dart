import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile = Tile(
    imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercises'),
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
            title: Text('Exercise 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise1()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercise 2 - Part A'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise2PartA()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercise 2 - Part B'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise2PartB()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercise 4'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise4()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercise 5 - Part A'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise5PartA()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercise 5 - Part B'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise5PartB()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Exercise1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://picsum.photos/512/512',
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}

class Exercise2PartA extends StatefulWidget {
  @override
  _Exercise2PartAState createState() => _Exercise2PartAState();
}

class _Exercise2PartAState extends State<Exercise2PartA> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scaleFactor = 1.0;
  bool _isMirrored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 2 Part A'),
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
                  'https://picsum.photos/512/512',
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

class Exercise2PartB extends StatefulWidget {
  @override
  _Exercise2PartBState createState() => _Exercise2PartBState();
}

class _Exercise2PartBState extends State<Exercise2PartB> {
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
        title: Text('Exercise 2 Part B'),
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
                  'https://picsum.photos/512/512',
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

class Exercise4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 4'),
      ),
      body: DisplayTileWidget(),
    );
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
              child: tile.croppedImageTile(),
            ),
          ),
          Container(
            height: 200,
            child: Image.network('https://picsum.photos/512', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class Exercise5PartA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 5 Part A'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) => Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Exercise5PartB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 5 Part B'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) => Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}













