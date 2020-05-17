import 'package:cv_19/screens/login_page/login_page.dart';
import 'package:cv_19/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
//import 'package:url_launcher/url_launcher.dart';

//code for the basic settings ui

class MySettingsPage extends StatelessWidget {
  final auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.blue,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.assignment,
                      color: Colors.blue,
                    ),
                    title: Text("About"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AboutRoute()), //Goes to about page
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    title: Text("Privacy Policy"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PrivacyRoute()), //Goes to privacy page
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.blue,
                    ),
                    title: Text("Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LanguageRoute()), //Goes to language page
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.timer,
                      color: Colors.blue,
                    ),
                    title: Text("Change daily reminder time"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReminderRoute()), //Goes to reminder page
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.feedback,
                      color: Colors.blue,
                    ),
                    title: Text("Send us feedback"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FeedbackRoute()), //Goes to feedback page
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.stars,
                      color: Colors.blue,
                    ),
                    title: Text("Rate us"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // launch("www.google.com");    //will go directly to the rate link in play store... for now it will go to google.com
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                    title: Text("Share"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Share.share(
                          "Flutter is cool!"); //We can share the text written within the quotes
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    title: Text('Logout'),
                    onTap: () {
                      auth.logout();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//About Page

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text(
          "About \n The field of machine learning is becoming more and more mainstream every year. With this growth come many libraries and tools to abstract away some of the most difficult concepts to implement for people starting out.Most people will say you need a higher level degree in ML to work in the industry. If you love working with data and practical math, then I would say this is not true. I did not graduate college with a Machine Learning or data degree yet I am working with ML right now at a startup. I want to share what I used to learn and how I got here in hopes that it will help someone else.",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//Privacy Page

class PrivacyRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
            "Privacy Policy\n The field of machine learning is becoming more and more mainstream every year. With this growth come many libraries and tools to abstract away some of the most difficult concepts to implement for people starting out.Most people will say you need a higher level degree in ML to work in the industry. If you love working with data and practical math, then I would say this is not true. I did not graduate college with a Machine Learning or data degree yet I am working with ML right now at a startup. I want to share what I used to learn and how I got here in hopes that it will help someone else."),
      ),
    );
  }
}

//Language Page

class LanguageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Language",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("English"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("हिन्दी"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("বাংলা"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("తెలుగు"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("मराठी"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("தமிழ்"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("മലയാളം"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Reminder Page

class ReminderRoute extends StatefulWidget {
  @override
  _ReminderRoute createState() => _ReminderRoute();
}

class _ReminderRoute extends State<ReminderRoute> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;
  String t;
  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    setState(() {
      _time = picked;
      print(_time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.alarm),
                onPressed: () {
                  selectTime(context);
                  print(_time);
                },
              ),
              Text("The time set  is "),
              Text(
                _time.format(context),
              ),
            ],
          ),
        ));
  }
}

//Feedback Page

class FeedbackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            SizedBox(height: 25.0),
            buildCheckItem("Issues"),
            buildCheckItem("Suggestions"),
            SizedBox(height: 20.0),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            buildNumberField(),
            Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                  onPressed: () {},
                  color: Color(0xffe5e5e5),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

buildNumberField() {
  return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Color(0xffc5c5c5)))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    "+91",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.cyan,
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Color(0xffc5c5c5),
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ));
}

buildFeedbackForm() {
  return Container(
    height: 200.0,
    child: Stack(children: <Widget>[
      TextField(
        maxLines: 10,
        decoration: InputDecoration(
          hintText: "Please briefly describe your",
          hintStyle: TextStyle(
            fontSize: 13.0,
            color: Color(0xffc5c5c5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe5e5e5)),
          ),
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xffa6a6a6)),
              ),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffe5e5e5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ],
            ),
          ))
    ]),
  );
}

buildCheckItem(title) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.0),
    child: Row(
      children: <Widget>[
        Icon(Icons.check_circle, color: Colors.blue),
        SizedBox(width: 10.0),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        )
      ],
    ),
  );
}
