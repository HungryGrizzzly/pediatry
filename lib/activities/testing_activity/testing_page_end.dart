import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class TestingPageEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('Тест успешно пройден!', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: ACCENT_COLOR),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'ГОТОВО',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashColor: SECONDARY_COLOR,
                    color: ACCENT_COLOR,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
