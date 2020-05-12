import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  var currentUser;
  var url = 'http://localhost:3000';

  Future<bool> loggedIn() async {
    return false;
  }

  Future<http.Response> login({String email, String passwd}) {
    return http.post(url + '/api/login',
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
        }));
  }

  Future<http.Response> signup({String email, String passwd}) {
    return http.post(url + '/api/signup',
        body: jsonEncode(<String, String>{
          'email': email,
          'passwd': passwd,
        }));
  }
}
