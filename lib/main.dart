import 'package:daily_diary/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'MyApp',
    home: MyApp(),
  ),extends
);

class MyApp  StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'daily_diary',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'daily_diary'),
    );
  }
}
