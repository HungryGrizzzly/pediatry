import 'package:flutter/material.dart';

class MainAppBar extends SliverAppBar{
  MainAppBar({
    Image leftImage,
    Image rightImage,
    String title,
}): super(
    leading:  IconButton(
          icon: leftImage,
          onPressed: (){

          }
      ),
    flexibleSpace: FlexibleSpaceBar(
      title: Text(title),
      centerTitle: true,
    ),
    elevation: .6,
    actions: <Widget>[
      IconButton(
        icon: rightImage,
        onPressed: (){

        },
      )
    ],
    pinned: false,
    floating: true,
    snap: true,
  );
}
