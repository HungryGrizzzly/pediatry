import 'package:flutter/material.dart';
import 'package:pediatry/pages/main_appbar.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';
import 'package:pediatry/activities/profile_activity.dart';

class NewsPage extends StatefulWidget{

  final void Function() openMenu;

  NewsPage({Key key, this.openMenu}):super(key: key);
  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage>{
  List<News> news = List();

  Widget _buildSliverAppBar(){
    return SliverAppBar(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileActivity()),
            );
          },
        )
      ],
      pinned: false,
      floating: true,
      snap: true,
    );
  }

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
        _buildSliverAppBar(),
        SliverNewsList(news: news)
      ],
    );
  }
}

class SliverNewsList extends StatelessWidget{

  SliverNewsList({Key key, this.news}): super(key: key);

  List<String> images = ['assets/images/card_1.png', 'assets/images/card_2.png', 'assets/images/card_3.png'];

  final List<News> news;

  Widget _buildCard(BuildContext context, int index){
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
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