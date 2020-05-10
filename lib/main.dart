import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './first.dart';
import './category.dart';
import './question.dart';
import './bookmark.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
 ));
   runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/first': (BuildContext context) => First(),
        '/cat': (BuildContext context) => Cat(),
        '/question': (BuildContext context) => QuestionPage(),
        '/bookmark':(BuildContext context)=>BookMark()
      },
      title: 'Quzzier',
      initialRoute: '/first',
    );
  }
}
