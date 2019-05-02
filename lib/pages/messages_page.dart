import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class MessagesPage extends StatefulWidget {
  final void Function() openMenu;

  MessagesPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {
  ScrollController _scrollController;

  double offset = 0;
  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      offset = _scrollController.offset;
      print(offset);
    });
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 24,
            height: 24,
          ),
          onPressed: widget.openMenu),
      title: Text(MESSAGES_TITLE),
      centerTitle: true,
      elevation: 1,
      actions: <Widget>[
        IconButton(
          icon: Image.asset(
            'assets/icons/user.png',
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {},
        )
      ],
      pinned: false,
      floating: true,
      snap: true,
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _buildItem(context, index);
      }, childCount: 20),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        height: 80,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFFD8D8D8), width: .5))),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: ACCENT_COLOR,
              backgroundImage: AssetImage('assets/images/user_image.png'),
              radius: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Иван Иванович',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Круто, записался!'),
                  )
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '14:03',
                  style: TextStyle(color: SECONDARY_COLOR),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ACCENT_COLOR),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[_buildSliverAppBar(), _buildSliverList()],
    );
  }
}
