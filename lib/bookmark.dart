import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookMark extends StatefulWidget {
  // String question;
  // String answer;
  // String q;
  // String a;
  // BookMark({this.q, this.a});
  // void post() {
  //   question = q;
  //   answer = a;
  //   print(question);
  //   print(answer);
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookMarkState();
  }
}

class _BookMarkState extends State<BookMark> {
  // List<String> book = [];
  // List<String> answer = [];
  // void sets() {
  //   setState(() {
  //     book.add(widget.question);
  //     answer.add(widget.answer);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var data = Firestore.instance.collection('Bookmark').snapshots();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Book Marks',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('Bookmark').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Loading...');
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      child: ListTile(
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Firestore.instance.runTransaction(
                                  (Transaction myTransaction) async {
                                await myTransaction.delete(snapshot
                                    .data.documents[position].reference);
                                _snackbarshow(context, 'Delete Successfuly...');
                              });
                            }),
                        onTap: () {},
                        title: Text(
                          'Question: ' +
                              snapshot.data.documents[position]['Question'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          'Answer: ' +
                              snapshot.data.documents[position]['Answer'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  });
            }));
  }

  void _snackbarshow(BuildContext context, String str) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.greenAccent,
      content: Text(str),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

// Widget getwidget() {
//   if (book.isEmpty && booka.isEmpty) {
//     return Text('No bookmark');
//   } else {

//   }
// }
