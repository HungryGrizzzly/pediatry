import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';
import 'dart:math';

class NewsPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage>{
  List<News> news = List();
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    news.add(News(id: 0,
        title: '24 февраля состоялось заседание Клуба детских гастроэнтерологов',
        imgUrl: 'assets/icons/image.png', likes: 2, comments: 4));
    news.add(News(id: 0,
        title: '24 февраля состоялось заседание Клуба детских гастроэнтерологов',
        imgUrl: 'assets/icons/image.png', likes: 2, comments: 4));
    news.add(News(id: 0,
        title: '24 февраля состоялось заседание Клуба детских гастроэнтерологов',
        imgUrl: 'assets/icons/image.png', likes: 2, comments: 4));
    _scrollViewController = new ScrollController();
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        MainAppBar(
          title: NEWS_TITLE,
          leftImage: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          rightImage: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
        ),
        SliverNewsList(news: news)
      ],
    );
  }
}

class SliverNewsList extends StatelessWidget{

  SliverNewsList({Key key, this.news}): super(key: key);

  final List<News> news;

  Widget _buildCard(BuildContext context, int index){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(news[index].imgUrl),
              ],
            ),
            Column(
              children: <Widget>[
                Text(news[index].title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(_buildCard, childCount: news.length ),

    );
  }

}