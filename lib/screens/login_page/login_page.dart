import 'package:cv_19/screens/signup_page/signup_page.dart';
import 'package:cv_19/services/auth_service.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

AuthService auth = new AuthService();

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

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

  Widget _buildPass() {
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
            controller: _pass,
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

  Widget _buildForgotBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 5.0),
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          bool loggedin =
              await auth.login(email: _email.text, passwd: _pass.text);
          print('Logged in' + loggedin.toString());
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        child: Text(
          "LOGIN",
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

  Widget _buildSignUpBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 5.0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
        child: Text(
          "New User? Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  ///bool remember;
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
                  "Sign In",
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

                _buildPass(), //password and password textfeild widget

                SizedBox(
                  height: 10.0,
                ),

                _buildForgotBtn(),

                SizedBox(
                  height: 10.0,
                ),

                _buildLoginBtn(), // login button widget

                SizedBox(
                  height: 20,
                ),

                _buildSignUpBtn(), // signup button widget
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
