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
    Text('Home', style: textStyle),
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
