import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class TestingPage extends StatefulWidget {
  final void Function() openMenu;

  TestingPage({Key key, this.openMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TestingPageState();
}

class TestingPageState extends State<TestingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 1.5,
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    height: MediaQuery.of(context).size.width * 1.4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFD8D8D8), width: .5))),
                      child: Image.asset('assets/images/test_image.png',
                          fit: BoxFit.cover),
                    )),
                Positioned(
                    right: 0,
                    top: 40,
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                      fillColor: Colors.black26,
                    )),
                Positioned(
                  bottom: 0,
                  right: 40,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border()),
                    child: Image.asset('assets/icons/test_book.png',
                        width: 60, height: 60),
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: Text(
                        'Тренировочный тест',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: ACCENT_COLOR),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: RaisedButton(
                          child: Text(
                            'НАЧАТЬ',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          onPressed: () {},
                          splashColor: SECONDARY_COLOR,
                          color: ACCENT_COLOR,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
