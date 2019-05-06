import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class WebinarsPage extends StatefulWidget{

  final void Function() openMenu;

  WebinarsPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => WebinarsPageState();

}

class WebinarsPageState extends State<WebinarsPage>{
  List<String> images = [
    'assets/images/t_1.png',
    'assets/images/t_2.png',
    'assets/images/t_3.png',
    'assets/images/t_4.png',

  ];
  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(WEBINARS_TITLE),
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
      pinned: true,
    );
  }

  Widget _sliverGridItemBuilder(BuildContext context, int index){
    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/translation');
          },
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                images[index % 4],
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [.4, .9],
                        colors: [
                          Colors.transparent,
                          Colors.black.withAlpha(120)
                        ]
                    )
                ),
              ),
              Positioned(
                bottom: 25,
                left: 10,
                child: Text('24.02', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text('19.00', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              Positioned(
                bottom: 9,
                left: 51,
                child: Container(
                  width: 1,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 4,
                left: 60,
                child: Container(
                  width: 95,
                  height: 32,
                  child: Text('Современная педиатрия', style: TextStyle(fontSize: 13, color: Colors.white),),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildSliverGrid(){
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: .9
      ),
      delegate: SliverChildBuilderDelegate(
          _sliverGridItemBuilder,
          childCount: 16
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