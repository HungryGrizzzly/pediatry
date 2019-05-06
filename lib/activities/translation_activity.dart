import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class TranslationActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TranslationActivityState();
}

class TranslationActivityState extends State<TranslationActivity> {
  double offset = 0;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocus);
  }

  void _onFocus() {
    if (!focusNode.hasFocus) {
      setState(() {
        offset = 0;
      });
    } else {
      setState(() {
        offset = 250;
      });
    }
  }

  Widget _buildBottom() {
    return Positioned(
      bottom: 0 + offset,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 2.5 / 3.5,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                  focusNode: focusNode,
                  scrollPadding: EdgeInsets.all(10),
                  cursorColor: ACCENT_COLOR,
                  cursorRadius: Radius.circular(40),
                  cursorWidth: 5,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(border: InputBorder.none)),
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/send.png',
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
  
  Widget _buildLeftTop(){
    return Positioned(
      top: 40,
      left: 20,
      child: Row(
        children: <Widget>[
          Image.asset('assets/icons/watching.png', width: 30,),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('97', style: TextStyle(color: Colors.white, fontSize: 18),),
          )
        ],
      ),
    );
  }

  Widget _buildRightTop() {
    return Positioned(
      top: 25,
      right: 0,
      child: Row(
        children: <Widget>[
          Text(
            '1:35:17',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            fillColor: Colors.white54,
            elevation: 0,
          )
        ],
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            .05,
            .15,
            .85,
            1
          ],
              colors: [
            Colors.black26,
            Colors.transparent,
            Colors.transparent,
            Colors.black26
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('assets/images/translation_image.png',
                      fit: BoxFit.cover),
                ),
                _buildGradient(),
                _buildLeftTop(),
                _buildRightTop(),
                _buildBottom()
              ],
            )
          ],
        ));
  }
}
