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
  bool remember;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("COVID-19 Tracker App"),
      ),
      body: Container(
        //padding: EdgeInsets.all(7),
        margin: EdgeInsets.all(16.0),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text("Email:")],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5,
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Enter your Email",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text("Password:")],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5,
              child: TextField(
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Enter you password",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                  padding: EdgeInsets.only(right: 5.0),
                  onPressed: () {},
                  child: Text("Forgot Password?")),
            ),
            SizedBox(
              height: 5.0,
            ),
            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       Theme(
            //         data:ThemeData(unselectedWidgetColor: Colors.white),
            //         child: Checkbox(value: remember, onChanged: (val){setState(() {
            //           remember=val;
            //         });},checkColor: Colors.black,activeColor: Colors.white,),
            //       ),
            //       Text("Remeber Me")
            //     ],
            //   ),
            // )
            SizedBox(
              height: 5.0,
            ),
            Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () async {
                    bool loggedin = await auth.login(
                        email: _email.text, passwd: _pass.text);
                    print('Logged in' + loggedin.toString());
                  },
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                  padding: EdgeInsets.only(right: 5.0),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text("New User? Sign Up")),
            ),
          ],
        ),
      ),
    ));
  }
}
