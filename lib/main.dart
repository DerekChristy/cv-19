import 'package:cv_19/screens/home_page/home_page.dart';
import 'package:cv_19/screens/login_page/login_page.dart';
import 'package:cv_19/services/auth_service.dart';
import 'package:flutter/material.dart';

AuthService auth = new AuthService();
void main() async {
  Widget _defaultHome = new LoginPage();
  bool _result = await auth.loggedIn();
  if (_result) {
    _defaultHome = new MyHomePage();
  }
  runApp(MyApp(_defaultHome));
}

class MyApp extends StatelessWidget {
  final Widget _defaultHome;

  MyApp(this._defaultHome);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _defaultHome, //homeRoute,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(),
        '/login': (BuildContext context) => new LoginPage()
      },
    );
  }
}
