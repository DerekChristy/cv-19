import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          MainCard(),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
          NewsBottomPart(),
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        elevation: 9.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                "CASES IN INDIA",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                //used this to make all the columns spread out in the row
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "CONFIRMED",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+100",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "31,129",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "ACTIVE",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+100",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "31,129",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "RECOVERED",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+100",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "31,129",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "DEATHS",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+100",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "31,129",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "31 May",
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 19.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          AllNewsCard(),
        ],
      ),
    );
  }
}

class AllNewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
