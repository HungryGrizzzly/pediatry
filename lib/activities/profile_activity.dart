import 'package:flutter/material.dart';

class ProfileActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProfileActivityState();
}

class ProfileActivityState extends State<ProfileActivity>{


  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              elevation: 1,
              leading: IconButton(
                  icon: Image.asset('assets/icons/back.png', width: 22, height: 22,),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Иванов Иван Иванович",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      )),
                  background: Stack(
                    children: <Widget>[
                      Positioned(
                          width: 100,
                          height: 100,
                          top: 70,
                          left: 125,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/user_image.png'),
                          )
                      )
                    ],
                  )
              ),
            ),
          ];
        },
      body: Container(
        color: Colors.white,
      ),
    );
  }

}