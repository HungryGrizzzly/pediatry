import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'testing_page_start.dart';
import 'testing_page_questions.dart';
import 'testing_layout_type.dart';
import 'testing_page_end.dart';

class TestingActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestingActivityState();
}

class TestingActivityState extends State<TestingActivity>
    with TickerProviderStateMixin {
  TestingLayoutType currentPage = TestingLayoutType.startingPage;
  double position = 0;
  double dragStartPosition = 0;
  double previousPosition = 0;
  AnimationController _controller;

  Widget _buildBody() {
    switch (currentPage) {
      case TestingLayoutType.startingPage:
        return TestingPageStart(
          setCurrentPage: this.setCurrentPage,
        );
      case TestingLayoutType.questions:
        return TestingPageQuestions(
          setCurrentPage: this.setCurrentPage,
        );
      case TestingLayoutType.endPage:
        return TestingPageEnd();
      default:
        return TestingPageStart(
          setCurrentPage: this.setCurrentPage,
        );
    }
  }

  void setCurrentPage(TestingLayoutType page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
