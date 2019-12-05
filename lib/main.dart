import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: DiceView(),
    );
  }
}

class DiceView extends StatefulWidget {
  @override
  _DiceViewState createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {
  int _selectedIndex = 0;
  static TextStyle textStyle = TextStyle(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold);
  final options = [
    DicePage(),
    Text('About', style: textStyle),
    Text(
      'Settings',
      style: textStyle,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dicee"),
        elevation: 3.0,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: options[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), title: Text('About')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        elevation: 6.0,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftImageIndex = 1;
  int rightImageIndex = 1;

  changeImage() {
    leftImageIndex = Random().nextInt(6) + 1;
    rightImageIndex = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  changeImage();
                });
              },
              child: Image.asset(
                'images/dice$leftImageIndex.png',
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  changeImage();
                });
              },
              child: Image.asset(
                'images/dice$rightImageIndex.png',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
