import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  var currentUser;
  var url = 'http://localhost:3000';

  Future<bool> loggedIn() async {
    return false;
  }

  Future<bool> login({String email, String passwd}) async {
    final http.Response res = await http.post(url + '/api/login',
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
        }));
    if (res.statusCode == 200) {
      var user = json.decode(res.body);
      print(user);
      // save token to shared pref
    }
  }

  Future<String> signup({String email, String passwd}) async {
    final http.Response res = await http.post(url + '/api/signup',
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
        }));

    if (res.statusCode == 409) {
      return '409';
    } else if (res.statusCode == 401) {
      return '401';
    } else if (res.statusCode == 200) {
      return '200';
    } else {
      return 'unknown';
    }
  }
}
