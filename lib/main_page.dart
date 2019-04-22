import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/layout_type.dart';
import 'package:pediatry/pages/news_page.dart';
import 'package:pediatry/pages/translations_page.dart';
import 'package:pediatry/pages/menu_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  int _selectedTab = 0;
  LayoutType _layoutType = LayoutType.news;
  bool _isIconDecorNeeded = true;


  void _onSelectTab(int index){
    setState(() {
      _selectedTab = index;
      _isIconDecorNeeded = true;

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

  void openMenu(){
    setState(() {
      _selectedTab = 0;
      _layoutType = LayoutType.menu;
    });
    _isIconDecorNeeded = false;
  }


  Widget _buildBody(){
    switch(_layoutType){
      case LayoutType.news:
        return NewsPage(openMenu: openMenu,);
      case LayoutType.translations:
        return TranslationsPage(openMenu: openMenu,);
      case LayoutType.menu:
        return MenuPage();
      default:
        return NewsPage();
    }
  }

  BottomNavigationBarItem _buildItem({LayoutType layoutType, int index}){
    return BottomNavigationBarItem(
      icon: Image.asset(
        layoutIcon(layoutType),
        width: 24.0,
        height: 24.0,
        color: index == _selectedTab && _isIconDecorNeeded ? ACCENT_COLOR : SECONDARY_COLOR,
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
      fixedColor: _isIconDecorNeeded ? ACCENT_COLOR : SECONDARY_COLOR,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
