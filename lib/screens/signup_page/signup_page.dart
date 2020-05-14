import 'package:cv_19/screens/login_page/login_page.dart';
import 'package:cv_19/services/auth_service.dart';
import 'package:flutter/material.dart';

AuthService auth = new AuthService();

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _email = TextEditingController();
  final _passwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwd,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            MaterialButton(
              onPressed: () async {
                // loading animation
                String status =
                    await auth.signup(email: _email.text, passwd: _passwd.text);
                print('status: ' + status);
                if (status == '200') {
                  // goto login page
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
                  // show error
                }
              },
              child: Text('Sign Up'),
            ),
            Text('or'),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
