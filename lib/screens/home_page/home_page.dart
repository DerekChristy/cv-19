import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  // Add widgets here
  List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV-19'),
      ),
      body: _children[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('Q/A')),
          BottomNavigationBarItem(icon: Icon(Icons.note), title: Text('News')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedPage,
        onTap: pageChange,
        selectedItemColor: Colors.amber,
      ),
    );
  }

  void pageChange(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
