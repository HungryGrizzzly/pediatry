import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget{

  NewsPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text(title),
    );
  }
}