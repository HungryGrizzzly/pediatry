import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class ConferentionsPage extends StatefulWidget{

  final void Function() openMenu;

  ConferentionsPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => ConferentionsPageState();

}

class ConferentionsPageState extends State<ConferentionsPage>{

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(CONFERENTIONS_TITLE),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar()
      ],
    );
  }

}