import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class ConferentionsPage extends StatefulWidget{

  final void Function() openMenu;

  ConferentionsPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => ConferentionsPageState();

}

class ConferentionsPageState extends State<ConferentionsPage>
with SingleTickerProviderStateMixin {

  TabController _tabController;
  ScrollController _scrollController;
  double listViewOffset = 0.0;

  _buildSliverAppBar(BuildContext context, bool innerIsScrolled){
    return SliverAppBar(
        leading:  IconButton(
            icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
            onPressed: widget.openMenu
        ),
        title: Text(CONFERENTIONS_TITLE),
        centerTitle: true,
        elevation: .6,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
            onPressed: (){

            },
          )
        ],
        pinned: true,
        floating: true,
        snap: true,
        forceElevated: innerIsScrolled,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Прошедшие',),
            Tab(text: 'Ближайшие',)
          ],
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerIsScrolled){
        return <Widget>[
          _buildSliverAppBar(context, innerIsScrolled)
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Tab1(),
          Tab1()
        ],
      ),
    );
  }

}

class Tab1 extends StatefulWidget{

  @override
  Tab1State createState() => Tab1State();

}

class Tab1State extends State<Tab1>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(

          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text('element $index'),
            );
          },
          itemCount: 20,
      );
  }
}

class Tab2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text('element $index'),
          );
        },
        itemCount: 20,
      ),
    );
  }
}









































