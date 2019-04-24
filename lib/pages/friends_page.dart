import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'package:pediatry/models/friends_group.dart';
class FriendsPage extends StatefulWidget{

  final void Function() openMenu;

  FriendsPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => FriendsPageState();

}

class FriendsPageState extends State<FriendsPage>{
  List<FriendsGroup> friends;

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(FRIENDS_TITLE),
        centerTitle: true,
      ),
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/icons/add.png', width: 24.0, height: 24.0,),
          onPressed: (){

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
    friends = [
      FriendsGroup(group: 'A', friends: ['Алексий', 'Артем', 'Анна']),
      FriendsGroup(group: 'Б', friends: ['Борис', 'Браум']),
      FriendsGroup(group: 'В', friends: ['Виталий', 'Веспа', 'Ваня']),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        FriendsList(friends: this.friends,)
      ],
    );
  }
}

class FriendsList extends StatelessWidget{

  FriendsList({Key key, this.friends}):super(key: key);

  final List<FriendsGroup> friends;

  Widget _buildGroup(BuildContext context, int index){

    var currentGroup = friends[index].friends;

    return Column(
      children: <Widget>[
        Text(friends[index].group),
        Container(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                print(currentGroup[index]);
                return ListTile(
                  title: Text(currentGroup[index]),
                );
              }
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _buildGroup,
        childCount: friends.length
      ),
    );
  }

}