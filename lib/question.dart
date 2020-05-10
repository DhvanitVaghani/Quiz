import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import './bookmark.dart';

class QuestionPage extends StatefulWidget {
  String collection;
  QuestionPage({this.collection});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  int count = 1;
  int total = 10;
  int correctCount = 0;
  int bookid = 0;
  bool istransform = true;
  var option = ['A.', 'B.', 'C.', 'D.'];
  int dcount = 0;
  String quetion;
  String answerr;
  void ontap() {
    setState(() {
      if (dcount == 9) {
        istransform = true;
        resultdialog(correctCount, total);
        dcount = 0;
        count = 1;
        correctCount = 0;
      } else {
        istransform = true;
        dcount = dcount + 1;
        count = count + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.collection = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.greenAccent, elevation: 0.0),
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream:
                Firestore.instance.collection(widget.collection).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
              quetion = snapshot.data.documents[dcount]['Qtitle'];
              answerr = snapshot.data.documents[dcount]['Correct Answer'];
              return new Column(children: <Widget>[
                Container(
                    height: 300.0,
                    width: 500.0,
                    color: Colors.greenAccent,
                    child: new Column(children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 300, top: 20),
                          child: IconButton(
                              color: Colors.white,
                              iconSize: 30,
                              padding: EdgeInsets.only(right:50.0),
                              
                              icon: Icon(Icons.bookmark),
                              onPressed: () {
                                var ref = Firestore.instance
                                    .collection('Bookmark')
                                    .document('Q-$dcount');
                                ref.get().then((docData) => {
                                      if (docData.exists)
                                        {
                                          _snackbarshow(
                                              context, 'Already Bookmared..')
                                        }
                                      else
                                        {
                                          Firestore.instance
                                              .collection('Bookmark')
                                              .document('Q-$dcount')
                                              .setData({
                                            'Question': quetion,
                                            'Answer': answerr
                                          }),
                                          _snackbarshow(context,
                                              'Successfuly Bookmared..')
                                        }
                                    });
                              })),
                      new Container(
                          margin: EdgeInsets.only(top: 50),
                          child: new Text(
                            snapshot.data.documents[dcount]['Qtitle'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                backgroundColor: Colors.white,
                                inherit: false,
                                fontSize: 25.0,
                                color: Colors.black),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 50.0),
                          child: new Text(
                            '$count/$total',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                inherit: false,
                                fontSize: 20.0,
                                backgroundColor: Colors.white,
                                color: Colors.black),
                          )),
                    ])),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Transform.scale(
                      scale: istransform ? 1 : 1.5,
                      child: new RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            istransform = false;
                          });
                          if (snapshot.data.documents[dcount]
                                  ['Correct Answer'] ==
                              snapshot.data.documents[dcount]['O1']) {
                            _snackbarshow(
                                context, 'Congratulation Correct Answer');
                            setState(() {
                              correctCount += 1;
                            });
                          } else {
                            _snackbarshow(context, 'Sorry Wrong Answer');
                          }
                          ontap();
                        },
                        child: Text(
                          option[0] + snapshot.data.documents[dcount]['O1'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Transform.scale(
                      scale: istransform ? 1 : 1.5,
                      child: new RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            istransform = false;
                          });
                          if (snapshot.data.documents[dcount]
                                  ['Correct Answer'] ==
                              snapshot.data.documents[dcount]['O2']) {
                            _snackbarshow(
                                context, 'Congratulation Correct Answer');
                            setState(() {
                              correctCount += 1;
                            });
                          } else {
                            _snackbarshow(context, 'Sorry Wrong Answer');
                          }
                          ontap();
                        },
                        child: Text(
                          option[1] + snapshot.data.documents[dcount]['O2'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Transform.scale(
                      scale: istransform ? 1 : 1.5,
                      child: new RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            istransform = false;
                          });
                          if (snapshot.data.documents[dcount]
                                  ['Correct Answer'] ==
                              snapshot.data.documents[dcount]['O3']) {
                            _snackbarshow(
                                context, 'Congratulation Correct Answer');
                            setState(() {
                              correctCount += 1;
                            });
                          } else {
                            _snackbarshow(context, 'Sorry Wrong Answer');
                          }
                          ontap();
                        },
                        child: Text(
                          option[2] + snapshot.data.documents[dcount]['O3'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Transform.scale(
                      scale: istransform ? 1 : 1.5,
                      child: new RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            istransform = false;
                          });
                          if (snapshot.data.documents[dcount]
                                  ['Correct Answer'] ==
                              snapshot.data.documents[dcount]['O4']) {
                            _snackbarshow(
                                context, 'Congratulation Correct Answer');
                            setState(() {
                              correctCount += 1;
                            });
                          } else {
                            _snackbarshow(context, 'Sorry Wrong Answer');
                          }

                          ontap();
                        },
                        child: Text(
                          option[3] + snapshot.data.documents[dcount]['O4'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )),
              ]);
            }));
  }

  void _snackbarshow(BuildContext context, String str) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 1),
      content: Text(str),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void resultdialog(int correct, int t) {
    AlertDialog alertDialog = AlertDialog(
      title: correct < 5 ? Text('Bad Performancce') : Text('Good Performance'),
      titleTextStyle: TextStyle(color: Colors.white),
      content: Text(
        'Your Score : $correct/$t',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Try Again',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text(
            'Try Another Category',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.popAndPushNamed(context, '/cat'),
        ),
      ],
      backgroundColor: Colors.greenAccent,
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
