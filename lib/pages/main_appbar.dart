import 'package:flutter/material.dart';

class MainAppBar extends AppBar{
  MainAppBar({
    Image leftImage,
    Image rightImage,
    String title
}): super(
    leading:  IconButton(
          icon: leftImage,
          onPressed: (){

          }
      ),
    centerTitle: true,
    title: Text(title),
    elevation: .6,
    actions: <Widget>[
      IconButton(
        icon: rightImage,
        onPressed: (){

        },
      )
    ]
  );
}