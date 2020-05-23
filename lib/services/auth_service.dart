import 'dart:convert';
import 'dart:io';
import 'package:cv_19/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  SharedPreferences prefs;
  var url = 'https://cv-19-app.herokuapp.com';
  // var url = 'http://10.0.2.2';
  Future<bool> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    print('prefrence init done');
    return true;
  }

  Future<User> user() async {
    String token = prefs.getString('token');
    print('AuthHeaderToken $token');
    final http.Response res = await http.get(url + '/api/user',
        headers: {HttpHeaders.authorizationHeader: token});
    print(res.body);
    if (res.statusCode == 200) {
      User user = new User.fromJson(json.decode(res.body));
      return user;
    } else {
      return null;
    }
  }

  bool loggedIn() {
    String token = prefs.getString('token');
    print('Token: $token');
    if (token == null) {
      return false;
    }
    if (token.length > 50) {
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    if (prefs == null) {
      initPrefs().then((value) => prefs.remove('token'));
    } else {
      prefs.remove('token');
    }
  }

  Future<bool> login({String email, String passwd}) async {
    final http.Response res = await http.post(url + '/api/login',
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
        }));
    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> user = json.decode(res.body);
      print(user);
      prefs.setString('token', user['token']);
      return true;
    } else {
      return false;
    }
  }

  Future<String> signup(
      {String email, String passwd, String name, String age}) async {
    print('signup called with ' + email);
    final http.Response res = await http.post(url + '/api/addUser',
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
          'name': name,
          'age': age
        }));

    print(res.body);

    if (res.statusCode == 409) {
      // existing user
      return '409';
    } else if (res.statusCode == 401) {
      // cannot connect to db
      return '401';
    } else if (res.statusCode == 200) {
      // success
      return '200';
    } else {
      return 'unknown';
    }
  }
}
