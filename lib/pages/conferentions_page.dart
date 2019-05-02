import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class ConferentionsPage extends StatefulWidget {
  final void Function() openMenu;

  ConferentionsPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ConferentionsPageState();
}

class ConferentionsPageState extends State<ConferentionsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  double listViewOffset = 0.0;
  
  _buildSliverAppBar(BuildContext context, bool innerIsScrolled) {
    return SliverAppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 24,
            height: 24,
          ),
          onPressed: widget.openMenu),
      title: Text(CONFERENTIONS_TITLE),
      centerTitle: true,
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            'assets/icons/user.png',
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {},
        )
      ],
      pinned: true,
      floating: true,
      snap: true,
      forceElevated: innerIsScrolled,
      bottom: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: 'Ближайшие',
          ),
          Tab(
            text: 'Прошедшие',
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController =
        ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerIsScrolled) {
        return <Widget>[_buildSliverAppBar(context, innerIsScrolled)];
      },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Tab1(), Tab1()],
      ),
    );
  }
}

class Tab1 extends StatefulWidget {
  @override
  Tab1State createState() => Tab1State();
}

class Tab1State extends State<Tab1> {
  final List<String> images = [
    'assets/images/t_1.png',
    'assets/images/t_2.png',
    'assets/images/t_3.png',
    'assets/images/t_4.png',
  ];

 Widget _buildCard(BuildContext context, int index){
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: (){
          print("tap");
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
              child: Text('24.02', style: TextStyle(color: Colors.white),),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text('19.00', style: TextStyle(color: Colors.white),),
            ),
            Positioned(
              bottom: 11,
              left: 51,
              child: Container(
                width: 1,
                height: 30,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 60,
              child: Container(
                width: 90,
                height: 32,
                child: Text('Современная педиатрия', style: TextStyle(fontSize: 14, color: Colors.white),),
              ),
            ),
          ],
        ),
      )
    );
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2

      ) ,
      itemBuilder: _buildCard,
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('element $index'),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
