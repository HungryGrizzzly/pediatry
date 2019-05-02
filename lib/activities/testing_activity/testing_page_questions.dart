import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'testing_layout_type.dart';

class TestingPageQuestions extends StatefulWidget {
  final Function setCurrentPage;
  TestingPageQuestions({Key key, this.setCurrentPage}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TestingPageQuestionsState();
}

class TestingPageQuestionsState extends State<TestingPageQuestions> {
  int numOfQuestions = 1;
  int currentQuestion = 1;
  int _groupValue = -1;
  bool _isButtonDisabled = false;
  List answers = ['1-2', '3-4', '5-6', '7-9'];

  void setButtenEnabled() {
    setState(() {
      _isButtonDisabled = true;
    });
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            width: 22,
            height: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      elevation: 1,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Вопрос',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            '$currentQuestion из $numOfQuestions',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
      centerTitle: true,
    );
  }

  Widget _buildImage(String url) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
    );
  }

  Widget _buildQuestion(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 1.4),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
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
                'ПРОДОЛЖИТЬ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              disabledColor: ACCENT_COLOR.withAlpha(70),
              disabledTextColor: Colors.white,
              onPressed: _isButtonDisabled
                  ? () {
                      widget.setCurrentPage(TestingLayoutType.endPage);
                    }
                  : null,
              splashColor: SECONDARY_COLOR,
              color: ACCENT_COLOR,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    _buildImage('assets/images/test_question.png'),
                    _buildQuestion(
                        'Наиболее верояные сроки возникновения гипертермии, как специфической реакции на введение АКДС (дни):'),
                    Answers(
                      answers: answers,
                      setButtonEnabled: this.setButtenEnabled,
                    )
                  ],
                ),
              ),
            ),
            _buildBottomButton()
          ],
        ));
  }
}

class Answers extends StatefulWidget {
  final List answers;
  final Function setButtonEnabled;

  Answers({Key key, this.answers, this.setButtonEnabled}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnswersState();
}

class AnswersState extends State<Answers> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Column(
        children: _createAnswers(),
      ),
    );
  }

  void _handleRadioChenge(int value) {
    setState(() {
      _groupValue = value;
    });
    widget.setButtonEnabled();
  }

  List<Widget> _createAnswers() {
    List<Widget> list = new List.generate(widget.answers.length, (index) {
      return Row(
        children: <Widget>[
          Radio(
            value: index,
            groupValue: _groupValue,
            onChanged: _handleRadioChenge,
          ),
          Text(widget.answers[index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
        ],
      );
    });
    return list;
  }
}
