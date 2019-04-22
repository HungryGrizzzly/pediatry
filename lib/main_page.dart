import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/layout_type.dart';
import 'package:pediatry/models/menu_item.dart';

import 'package:pediatry/pages/news_page.dart';
import 'package:pediatry/pages/translations_page.dart';
import 'package:pediatry/pages/friends_page.dart';
import 'package:pediatry/pages/webinars_page.dart';
import 'package:pediatry/pages/conferentions_page.dart';
import 'package:pediatry/pages/testing_page.dart';
import 'package:pediatry/pages/details_page.dart';
import 'package:pediatry/pages/support_page.dart';
import 'package:pediatry/pages/messages_page.dart';


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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<MenuItem> menuItems = [MenuItem('Друзья', 'assets/icons/friends.png')];

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
    _scaffoldKey.currentState.openDrawer();
  }

  Widget _buildBody(){
    switch(_layoutType){

      case LayoutType.news:
        return NewsPage(openMenu: openMenu,);
      case LayoutType.translations:
        return TranslationsPage(openMenu: openMenu,);
      case LayoutType.messages:
        return MessagesPage();
      case LayoutType.friends:
        return FriendsPage();
      case LayoutType.webinars:
        return WebinarsPage();
      case LayoutType.conferentions:
        return ConferentionsPage();
      case LayoutType.testing:
        return TestingPage();
      case LayoutType.details:
        return DetailsPage();
      case LayoutType.support:
        return SupportPage();
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
      title: Container(height: 0.0,)
    );
  }

  Widget _buildBottomNavBar(){
    return SizedBox(
      height: 44.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(layoutType: LayoutType.news, index: 0),
          _buildItem(layoutType: LayoutType.translations, index: 1),
          _buildItem(layoutType: LayoutType.messages, index: 2)
        ],
        onTap: _onSelectTab,
        currentIndex: _selectedTab > 2 ? 0 : _selectedTab,
        fixedColor: _isIconDecorNeeded ? ACCENT_COLOR : SECONDARY_COLOR,
      ),
    );
  }

  Widget _buildMenuItem(LayoutType layoutType){
    return ListTile(
        leading: Image.asset(
            layoutIcon(layoutType),
            width: 24.0,
          height: 24.0,
        ),
        title: Text(layoutName(layoutType)),
      trailing:  Image.asset(
          'assets/icons/forward.png',
          width: 16.0,
          height: 16.0,
      ),
      onTap: (){
          setState(() {
            _layoutType = layoutType;
            _selectedTab = 3;
            _scaffoldKey.currentState.openEndDrawer();
          });
      },
    );
    
    
  }

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: ACCENT_COLOR,
                  radius: 50.0,
                  child: Image.asset('assets/icons/user.png', width: 50.0, color: Colors.white,),
                ),
                Text('Иванов Иван Иванович', style: TextStyle(fontSize: 16.0),),
                Text('Гастроинтеролог, Минск', style: TextStyle(fontSize: 12.0, color: SECONDARY_COLOR),)
              ],
            ),
          ),
          _buildMenuItem(LayoutType.friends),
          _buildMenuItem(LayoutType.webinars),
          _buildMenuItem(LayoutType.conferentions),
          _buildMenuItem(LayoutType.testing),
          _buildMenuItem(LayoutType.details),
          _buildMenuItem(LayoutType.support),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}

class CircleImage extends StatelessWidget{

  CircleImage({Key key, this.image}): super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
        ),
      child: Image.asset(image),
    );
  }
}
