import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/friends_group.dart';

class FriendsPage extends StatefulWidget {
  final void Function() openMenu;

  FriendsPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  final List<ListItem> friendsList = [
    HeadingItem('А'),
    FriendItem('Алексей Анатольевич'),
    FriendItem('Андрей Борисович'),
    FriendItem('Анна Сергеевна'),
    HeadingItem('Б'),
    FriendItem('Борис Андреевич'),
    FriendItem('Белла Сергеевна'),
     HeadingItem('В'),
    FriendItem('Виктор Максимович'),
    FriendItem('Владислав Сергеевич'),
     HeadingItem('Ю'),
    FriendItem('Юлия Алексеевна'),
    FriendItem('Юрий Владимирович'),
  ];

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 24,
            height: 24,
          ),
          onPressed: widget.openMenu),
      title: Text(FRIENDS_TITLE),
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
      pinned: true,
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final item = friendsList[index];
        if (item is HeadingItem) {
          return Container(
            color: Colors.white,
            child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
            title: Text(
              item.heading,
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          ),
          );
        } else if (item is FriendItem) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_image.png'),
              radius: 20,
            ),
            title: Text(item.friend),
          );
        }
      }, childCount: friendsList.length),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[_buildSliverAppBar(), _buildSliverList()],
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  HeadingItem(this.heading);

  final String heading;
}

class FriendItem implements ListItem {
  FriendItem(this.friend);

  final String friend;
}
