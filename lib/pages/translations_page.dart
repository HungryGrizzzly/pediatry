import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class TranslationsPage extends StatefulWidget{

  final void Function() openMenu;

  TranslationsPage({Key key, this.openMenu}): super(key: key);

  @override
  State<StatefulWidget> createState() => TranslationPageState();

}

class TranslationPageState extends State<TranslationsPage>{

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(TRANSLATIONS_TITLE),
        centerTitle: true,
      ),
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/icons/filter.png', width: 24.0, height: 24.0,),
          onPressed: (){
          },
        )
      ],
      pinned: false,
      floating: true,
      snap: true,
    );
  }

  Widget _sliverGridItemBuilder(BuildContext context, int index){
    return Container(
      alignment: Alignment.center,
      color: Colors.teal[100*(index%9)],
      child: Text('grid item $index'),
    );
  }

  Widget _buildSliverGrid(){
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0
      ),
      delegate: SliverChildBuilderDelegate(
        _sliverGridItemBuilder,
        childCount: 40
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        _buildSliverGrid()
      ],
    );
  }

}