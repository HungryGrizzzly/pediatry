import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';

class TranslationActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Image.asset('assets/images/translation_image.png'),
            )
          ],
        ),
      ),
    );
  }
}
