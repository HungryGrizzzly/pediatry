import 'package:flutter/material.dart';

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
