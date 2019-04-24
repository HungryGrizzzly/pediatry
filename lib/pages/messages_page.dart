import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class MessagesPage extends StatefulWidget{

  final void Function() openMenu;

  MessagesPage({Key key, this.openMenu}): super(key: key);
  @override
  State<StatefulWidget> createState() => MessagesPageState();

}

class MessagesPageState extends State<MessagesPage>{

  ScrollController _scrollController;
  double offset = 0;
  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener(){
    setState(() {
      offset = _scrollController.offset;
      print(offset);
    });
  }

  Widget _buildSliverAppBar(){
    return SliverAppBar(
      leading:  IconButton(
          icon: Image.asset('assets/icons/menu.png', width: 24, height: 24,),
          onPressed: widget.openMenu
      ),
        title: Text(offset.toString()),
        centerTitle: true,
      elevation: .6,
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/icons/user.png', width: 24.0, height: 24.0,),
          onPressed: (){

          },
        )
      ],
      pinned: true,
      bottom: new PreferredSize(
        preferredSize: Size(0, 40),
        child: Center(
          child: Text('asdsdsd'),
        ),
      ),
    );
  }

  Widget _buildSliverList(){
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index){
            return _buildItem(context, index);
          },
        childCount: 20
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/user_image.png'),
        ),
        title: Text('item $index'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        _buildSliverAppBar(),
        _buildSliverList()
      ],
    );
  }

}