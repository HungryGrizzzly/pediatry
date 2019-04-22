import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';

class NewsPage extends StatefulWidget{

  final void Function() openMenu;

  NewsPage({Key key, this.openMenu}):super(key: key);
  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage>{
  List<News> news = List();

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
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading:  IconButton(
              icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
              onPressed: widget.openMenu
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(NEWS_TITLE),
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