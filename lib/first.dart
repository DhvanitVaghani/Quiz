import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,elevation: 0.0,),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                height: 350.0,
                width: 500.0,
                child: Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: new Text(
                      'Quizzer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          inherit: false, fontSize: 40.0, color: Colors.black),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: new RaisedButton(
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.greenAccent),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cat');
                  },
                  child: Text(
                    'Get Started..',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: new RaisedButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/bookmark');
                  },
                  child: Text(
                    'Book Marks',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
