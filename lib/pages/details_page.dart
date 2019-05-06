import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/details.dart';
import 'package:pediatry/views/buttons.dart';

class DetailsPage extends StatefulWidget {
  final void Function() openMenu;

  DetailsPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final List details = [
    new Detail('Ребенок с пневмонией на приеме врача педиатра',
        'assets/images/details_image1.png', 'assets/icons/heart_circle.png'),
    new Detail("Клинический разбор паралич STRUMPELL’Я",
        'assets/images/details_image2.png', 'assets/icons/heart_circle.png'),
    new Detail(
        'Опыт применения препарата Джосет при остром обструктивном бронхите у детей',
        'assets/images/details_image3.png',
        'assets/icons/pills_circle.png'),
  ];

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 24,
            height: 24,
          ),
          onPressed: widget.openMenu),
      title: Text(DETAILS_TITLE),
      centerTitle: true,
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            'assets/icons/add.png',
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildCard(BuildContext context, int position) {
    var image = Image.asset(details[position].imgUrl);
    var title = Text(
      details[position].title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 1.2),
    );
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      semanticContainer: true,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(Routes['details']);
        },
        child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 202,
              ),
              Positioned(
                height: 180,
                child: image,
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 16.2,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border()),
                ),
              ),
              Positioned(
                  bottom: 2,
                  left: MediaQuery.of(context).size.width / 16.2 + 2,
                  child: Image.asset(
                    details[position].type,
                    width: 60,
                    height: 60,
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            child: title,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('2 часа назад'),
                Row(
                  children: <Widget>[
                    LikesButton(
                      likes: 3,
                    ),
                    CommentsButton(
                      comments: 3,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemBuilder: _buildCard,
        itemCount: details.length,
      ),
    );
  }
}
