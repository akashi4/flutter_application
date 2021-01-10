import 'package:flutter/material.dart';
import 'package:flutterapplication/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Persistance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomAppBarColor: Colors.blue,
      ),
        home: Home(),
    );
  }
}