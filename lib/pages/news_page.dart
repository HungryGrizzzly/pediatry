import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';

class NewsPage extends StatelessWidget{

  NewsPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MainAppBar(
        title: title,
        leftImage: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
        rightImage: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
      ),
      body: Text(title),
    );
  }
}