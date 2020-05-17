import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  SharedPreferences prefs;
  var url = 'http://192.168.43.59:3000';

  Future<bool> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    print('prefrence init done');
    return true;
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

  Future<String> signup({String email, String passwd}) async {
    print('signup called with ' + email);
    final http.Response res = await http.post(url + '/api/addUser',
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
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
