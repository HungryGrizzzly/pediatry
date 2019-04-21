import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/layout_type.dart';
import 'package:pediatry/pages/news_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  int _selectedTab = 0;
  LayoutType _layoutType = LayoutType.news;


  void _onSelectTab(int index){
    setState(() {
      _selectedTab = index;

      switch(index){
        case 0:
          _layoutType = LayoutType.news;
          break;
        case 1:
          _layoutType = LayoutType.translations;
          break;
        case 2:
          _layoutType = LayoutType.messages;
          break;
      }
    });
  }

  Widget _buildAppBar(){
    return AppBar(
      title: Text(layoutName(_layoutType)),
      elevation: 1.0,

    );
  }

  Widget _buildBody(){
        return NewsPage(title: layoutName(_layoutType),);
  }

  BottomNavigationBarItem _buildItem({LayoutType layoutType, int index}){
    return BottomNavigationBarItem(
      icon: Image.asset(
        layoutIcon(layoutType),
        width: 24.0,
        height: 24.0,
        color: index == _selectedTab? Colors.pink : Colors.grey,
      ),
      title: Text(
          layoutName(layoutType),
      ),
    );
  }

  Widget _buildBottomNavBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(layoutType: LayoutType.news, index: 0),
        _buildItem(layoutType: LayoutType.translations, index: 1),
        _buildItem(layoutType: LayoutType.messages, index: 2)
      ],
      onTap: _onSelectTab,
      currentIndex: _selectedTab,
      iconSize: 20.0,
      fixedColor: Colors.pink,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
     bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
