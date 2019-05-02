import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class ProfileActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileActivityState();
}

class ProfileActivityState extends State<ProfileActivity> {
  Widget _buildSliverBar() {
    double iconWidth = MediaQuery.of(context).size.width / 3.5;
    return SliverAppBar(
      expandedHeight: 200.0,
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
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text("Иванов Иван Иванович",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              )),
          background: Stack(
            children: <Widget>[
              Positioned(
                width: iconWidth,
                height: iconWidth,
                top: 70,
                left: MediaQuery.of(context).size.width / 2 - iconWidth / 2,
                child: CircleAvatar(
                  backgroundImage: AssetImage(USER_IMAGE),
                  backgroundColor: ACCENT_COLOR,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext mainContext) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[_buildSliverBar()];
      },
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Редактировать'),
              onPressed: () {},
              splashColor: SECONDARY_COLOR,
              color: ACCENT_COLOR,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
