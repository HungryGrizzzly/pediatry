import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';
import 'package:pediatry/activities/profile_activity.dart';

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
        IconButton(
          icon: Image.asset(
            'assets/icons/user.png',
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {
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
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 186,
                    ),
                    Image.asset(news[index].imgUrl),
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
        ));
  }

  Widget _buildTitle(String title) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
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
          Likes(amount: 2,),
          _buildComments()
        ],
      ),
    );
  }

  Widget _buildLikes() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          alignment: Alignment(0, 0),
          child: Container(
            width: 30,
            height: 40,
            alignment: Alignment(10, 0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/icons/like.png', width: 14, height: 14),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildComments() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          alignment: Alignment(0, 0),
          child: Container(
            width: 30,
            height: 40,
            alignment: Alignment(10, 0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/icons/comments.png', width: 14, height: 14),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(_buildCard, childCount: news.length),
    );
  }
}

class Likes extends StatelessWidget {
  Likes({Key key, this.amount}) : super(key: key);

  var amount = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          amount++;
        },
        child: Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          alignment: Alignment(0, 0),
          child: Container(
            width: 30,
            height: 40,
            alignment: Alignment(10, 0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/icons/like.png', width: 14, height: 14),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    amount.toString(),
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
