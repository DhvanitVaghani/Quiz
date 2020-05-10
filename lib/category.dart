import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CatState();
  }
}

class _CatState extends State<Cat> {
  List<String> collection = [
    'ScienceQuestions',
    'Maths',
    'History',
    'GK',
    'Economy',
    'Computer'
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void navi(int index) {
      Navigator.pushNamed(context, '/question',arguments: collection[index]);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/first');
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Category'),
        ),
        body: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(1);
                },
                title: Text('Math'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/math.png"),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(0);
                },
                title: Text('Science'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/sci.png"),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(2);
                },
                title: Text('History'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/history.png"),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(3);
                },
                title: Text('General Knowledge'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/gk.jpg"),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(5);
                },
                title: Text('Computer Basic'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/comp.png"),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new ListTile(
                onTap: () {
                  navi(4);
                },
                title: Text('Indian Economy'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/economy.png"),
                ),
              )),
        ]));
  }
}
