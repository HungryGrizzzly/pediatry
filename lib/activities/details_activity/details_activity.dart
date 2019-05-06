import 'package:flutter/material.dart';
import 'details_layout_type.dart';
import 'details_start_page.dart';
import 'details_questions_page.dart';

class DetailsActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailsActivityState();
}

class DetailsActivityState extends State<DetailsActivity> {
  DetailsLayoutType layoutType = DetailsLayoutType.start;
  Widget _buildBody() {
    switch (layoutType) {
      case DetailsLayoutType.start:
        return DetailsStartPage(setLayouttype: this.setLayoutType,);
      case DetailsLayoutType.questions:
        return DetailsQuestionsPage(setLayoutType: this.setLayoutType,);
    }
  }

  void setLayoutType(DetailsLayoutType type){
    setState(() {
     this.layoutType = type; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody()
    );
  }
}
