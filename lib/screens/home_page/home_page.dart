import 'package:cv_19/screens/example/examplePage.dart'; // importing the page to add
import 'package:cv_19/screens/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  // Add widgets here
  List<Widget> _children = [
    ExampleWidget(Colors.blueAccent),
    ExampleWidget(Colors.amberAccent),
    ExampleWidget(Colors.cyanAccent),
    MySettingsPage(),
  ];
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
        onTap: _onTabTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
