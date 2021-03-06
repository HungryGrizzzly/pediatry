import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';
import 'package:pediatry/activities/profile_activity.dart';
import 'package:pediatry/routes/slide_right_route.dart';
import 'package:pediatry/routes/fade_in.dart';
import 'package:pediatry/views/buttons.dart';
class NewsPage extends StatefulWidget {
  final void Function() openMenu;

  NewsPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  List<News> news = List();

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 24,
            height: 24,
          ),
          onPressed: widget.openMenu),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(NEWS_TITLE),
        centerTitle: true,
      ),
      elevation: .6,
      actions: <Widget>[
        Hero(
          tag: 'userImage',
          child: IconButton(
            icon: Image.asset(
              USER_IMAGE,
              width: 30.0,
              height: 30.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        )
      ],
      pinned: true,
    );
  }

  @override
  void initState() {
    super.initState();
    news.add(News(
        id: 0,
        title:
            '24 февраля состоялось заседание Клуба детских гастроэнтерологов',
        imgUrl: 'assets/images/card_1.png',
        likes: 2,
        comments: 4));
    news.add(News(
        id: 0,
        title: 'Обучающие видеоуроки по оториноларингологии!',
        imgUrl: 'assets/images/card_3.png',
        likes: 2,
        comments: 4));
    news.add(News(
        id: 0,
        title:
            '9 марта состоялась трансляция вебинара на тему “Уход за кожей ребенка”',
        imgUrl: 'assets/images/card_2.png',
        likes: 2,
        comments: 4));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[_buildSliverAppBar(), SliverNewsList(news: news)],
    );
  }
}

class SliverNewsList extends StatelessWidget {
  SliverNewsList({Key key, this.news}) : super(key: key);

  final List<String> images = [
    'assets/images/card_1.png',
    'assets/images/card_2.png',
    'assets/images/card_3.png'
  ];

  final List<News> news;

  Widget _buildCard(BuildContext context, int index) {
    return Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/news',
                arguments: NewsArguments(
                    title: news[index].title, url: news[index].imgUrl, heroTag: 'newsImage$index'));
          },
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 186,
                      ),
                      Hero(
                        tag: 'newsImage$index',
                        child: Image.asset(news[index].imgUrl),
                      ),
                      Positioned(
                          left: 23,
                          bottom: 0,
                          child: Image.asset(
                            'assets/icons/doctor_circle.png',
                            width: 54,
                            height: 54,
                          ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _buildTitle(news[index].title),
                      _buildCardBottom(index)
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildTitle(String title) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              letterSpacing: .3,
              height: 1.1),
        ));
  }

  Widget _buildCardBottom(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '2 часа назад',
            style: TextStyle(color: Colors.grey),
          ),
          Spacer(),
          LikesButton(likes: 2,),
          CommentsButton(comments: 2,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(_buildCard, childCount: news.length),
    );
  }
}
