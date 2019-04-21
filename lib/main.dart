import 'package:flutter/material.dart';
import 'package:pediatry/main_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pediatry',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.pink,
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

