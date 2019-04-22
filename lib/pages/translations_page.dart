import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';
import 'package:pediatry/constants.dart';

class TranslationsPage extends StatelessWidget{

  final void Function() openMenu;

  TranslationsPage({Key key, this.openMenu}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading:  IconButton(
            icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
            onPressed: this.openMenu
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: Text(NEWS_TITLE),
          centerTitle: true,
        ),
        elevation: .6,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
            onPressed: (){
            },
          )
        ],
        pinned: false,
        floating: true,
        snap: true,
        ),
        ],
    );
  }

}