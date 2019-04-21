import 'package:flutter/material.dart';
import 'package:pediatry/main_page.dart';
import 'package:flutter/services.dart';
import 'package:pediatry/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));

    return MaterialApp(
      title: 'pediatry',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: ACCENT_COLOR,
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
      ),
      home: MainPage(title: 'Pediatry'),
    );
  }
}

