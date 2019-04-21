import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';
import 'package:pediatry/constants.dart';

class TranslationsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        MainAppBar(
          title: TRANSLATIONS_TITLE,
          leftImage: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          rightImage: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
        ),
      ],
    );
  }

}