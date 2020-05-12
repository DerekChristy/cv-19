import 'package:cv_19/services/auth_service.dart';
import 'package:flutter/material.dart';

AuthService auth = new AuthService();

class SignupPage extends StatelessWidget {
  TextEditingController _email = new TextEditingController();
  TextEditingController _passwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            MaterialButton(
              onPressed: () async {
                // loading animation
                String status =
                    await auth.signup(email: _email.text, passwd: _passwd.text);
                if (status == '200') {
                  // goto login page
                  Navigator.pop(context);
                }
              },
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
