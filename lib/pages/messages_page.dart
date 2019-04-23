import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class MessagesPage extends StatefulWidget{

  final void Function() openMenu;

  MessagesPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => MessagesPageState();

}

class MessagesPageState extends State<MessagesPage>{

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(MESSAGES_TITLE),
        centerTitle: true,
      ),
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/icons/write_message.png', width: 24.0, height: 24.0,),
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