import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/news.dart';
import 'package:pediatry/models/comment.dart';

class NewsActivity extends StatefulWidget {
  final String title;
  final String url;
  final String heroTag;
  NewsActivity({Key key, this.title, this.url, this.heroTag}) : super(key: key);
  @override
  State<StatefulWidget> createState() => NewsActivityState();
}

class NewsActivityState extends State<NewsActivity> {
  final String text =
      'Задача организации, в особенности же постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации модели развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке системы обучения кадров, соответствует насущным потребностям. Задача организации, в особенности же консультация с широким активом требуют определения и уточнения системы обучения кадров, соответствует насущным потребностям. Повседневная практика показывает, что укрепление и развитие структуры требуют определения и уточнения модели развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют от нас анализа системы обучения кадров, соответствует насущным потребностям. С другой стороны дальнейшее развитие различных форм деятельности требуют от нас анализа соответствующий условий активизации.';

  final List<Comment> comments = [
    Comment(
        userName: 'Алла Андреевна',
        text: 'Спасибо Челябинску за теплый прием!',
        imgUrl: 'assets/images/comment_image.png'),
    Comment(
        userName: 'Алла Андреевна',
        text: 'Спасибо Челябинску за теплый прием!',
        imgUrl: 'assets/images/comment_image.png'),
    Comment(
        userName: 'Алла Андреевна',
        text: 'Спасибо Челябинску за теплый прием!',
        imgUrl: 'assets/images/comment_image.png')
  ];
  Widget _buildAppBar() {
    return SliverAppBar(
      elevation: 1,
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            width: 22,
            height: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: widget.heroTag,
          child: Image.asset(
            widget.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
      pinned: true,
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Text(widget.title,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                _buildButtons(),
                _buildComments(),
              ],
            ),
          )),
        ),
        _buildBottomInput(),
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Комментарии',
            style: TextStyle(color: Colors.black45),
          ),
          Row(
            children: <Widget>[
              LikesButton(
                likes: 2,
              ),
              CommentsButton(
                comments: 2,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildComments() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: _buildCommentList(comments),
      ),
    );
  }

  List<Widget> _buildCommentList(List<Comment> comments) {
    List<Widget> list = new List.generate(comments.length, (index) {
      return Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(comments[index].imgUrl),
                  backgroundColor: ACCENT_COLOR,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      comments[index].userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        '2 часа назад',
                        style: TextStyle(color: SECONDARY_COLOR, fontSize: 14),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: Text(comments[index].text),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'ответить',
                      style: TextStyle(color: SECONDARY_COLOR),
                    ),
                  )),
              LikesButton(
                likes: 2,
              )
            ],
          )
        ],
      );
    });
    return list;
  }

  Widget _buildBottomInput() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: SECONDARY_COLOR)),
                child: TextField(
                    scrollPadding: EdgeInsets.all(10),
                    cursorColor: ACCENT_COLOR,
                    cursorRadius: Radius.circular(40),
                    cursorWidth: 5,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
              IconButton(
                color: ACCENT_COLOR,
                icon: Image.asset('assets/icons/send.png', color: ACCENT_COLOR),
                onPressed: () {},
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrooled) {
          return <Widget>[_buildAppBar()];
        },
        body: _buildBody(),
      ),
    );
  }
}

class LikesButton extends StatefulWidget {
  final int likes;
  LikesButton({Key key, this.likes}) : super(key: key);
  @override
  State<StatefulWidget> createState() => LikesButtonState(likes: this.likes);
}

class LikesButtonState extends State<LikesButton> {
  int likes;
  LikesButtonState({this.likes});

  void incrementLikes() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = likes >= 10 ? 80 : 50;
    return InkWell(
      borderRadius: BorderRadius.circular(80),
      onTap: () {
        this.incrementLikes();
      },
      child: Container(
        height: 50,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/like.png',
                width: 14,
                height: 14,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(likes.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommentsButton extends StatelessWidget {
  final int comments;
  CommentsButton({Key key, this.comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(80),
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/icons/comments.png',
                width: 16,
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(comments.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
