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

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: _passwd,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUP() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          // loading animation
          String status =
              await auth.signup(email: _email.text, passwd: _passwd.text);
          print('status: ' + status);
          if (status == '200') {
            // goto login page
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            // show error
          }
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blueAccent,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 5.0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text(
          "Already have a account? Login",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 Tracker App"),
      ),
      body: Container(
        color: Colors.blueAccent,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 120.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),

              _buildEmail(), // email and feildtext widget

              SizedBox(
                height: 20.0,
              ),

              _buildPassword(), // password and password textfeild widget

              SizedBox(
                height: 40.0,
              ),

              _buildSignUP(), // signup button widget

              SizedBox(
                height: 20,
              ),

              _buildLogin(), // login button widget
            ],
          ),
        ),
      ),
    ));
  }
}

/*
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
*/
