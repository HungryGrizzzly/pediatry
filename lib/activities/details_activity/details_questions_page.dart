import 'package:flutter/material.dart';
import 'package:pediatry/constants.dart';
import 'details_layout_type.dart';

class DetailsQuestionsPage extends StatefulWidget {
  final Function setLayoutType;
  DetailsQuestionsPage({Key key, this.setLayoutType}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DetailsQuestionsPageState();
}

class DetailsQuestionsPageState extends State<DetailsQuestionsPage> {
  int _currentQuestion = 0;
  int _groupValue = -1;
  bool _isButtonDisabled = true;
  List<Question> questions = [
    new RadioQuestion('Мальчик, 9 лет','assets/images/details_question.png','Жалобы родителей на момент осмотра (пятый день болезни)', ['Кашель;', 'Субфебрилитет;', '«Неправильное лечение» участкового педиатра.']),
    new CardQuestions('Анамнез жизни', [
      CardQuestionsModel('Беременность', 'Ребенок от 1 беременности, протекавшей без особенностей'),
      CardQuestionsModel('Роды', 'Самостоятельные на 40 неделе'),
      CardQuestionsModel('Масса тела при рождении', '3300 г'),
      CardQuestionsModel('Рост при рождении', '50 см'),
      CardQuestionsModel('Оценка по шкале Ангар', '8/9 баллов'),
      CardQuestionsModel('Время 1 прикладывания к груди', '1 сутки'),
      CardQuestionsModel('Неонатальный период', 'Без особенностей')
    ])
  ];

  void _handleRadioChenge(int value) {
    setState(() {
      _groupValue = value;
      _isButtonDisabled = false;
    });
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            questions[_currentQuestion].title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              '${_currentQuestion + 1} из ${questions.length}',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
      centerTitle: true,
      elevation: .6,
      // actions: <Widget>[
      //   IconButton(
      //     icon: Image.asset(
      //       'assets/icons/forward.png',
      //       width: 24.0,
      //       height: 24.0,
      //     ),
      //     onPressed: () {},
      //   )
      // ],
    );
  }

  Widget _buildBody(){
    if(questions[_currentQuestion] is RadioQuestion){
      RadioQuestion question = questions[_currentQuestion];
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(10),
                child: Image.asset(question.imgUrl),
              ),
              Column(
                children: _buildRadioButtons(),
              )
            ],
          ),
        ),
      );
    } else if(questions[_currentQuestion] is CardQuestions){
      CardQuestions question = questions[_currentQuestion];
      var size = MediaQuery.of(context).size;

      /*24 is for notification bar on Android*/
      final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
      final double itemWidth = size.width / 2;

      return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: question.questions.map(
                  (item) =>  _buildGridCard(item),
            ).toList()
        ),
      );
    }else {
      return Expanded(
        child: Text('text'),
      );
    }
  }
  
  Widget _buildGridCard(CardQuestionsModel question){
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.grey[200],
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              question.title,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                question.desc,
                style: TextStyle(

                ),
              ),
            )
          ],
        ),
      )
    );
  }

  List<Widget> _buildRadioButtons(){
    RadioQuestion question = questions[_currentQuestion];
    List<Widget> list = List.generate(question.buttons.length, (index){
      return Row(
        children: <Widget>[
          Radio(
            value: index,
            groupValue: _groupValue,
            onChanged: _handleRadioChenge,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 3/4,
            padding: EdgeInsets.only(right: 40),
            child: Text(question.buttons[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          )
        ],
      );
    });
    return list;
  }

  Widget _buildBottomButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
          child: SizedBox(
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
              onPressed: !_isButtonDisabled
                  ? () {
                if(_currentQuestion <questions.length - 1){
                  setState(() {
                    _currentQuestion++;
                  });
                } else {
                  Navigator.pop(context);
                }
              }
                  : null,
              splashColor: SECONDARY_COLOR,
              color: ACCENT_COLOR,
              textColor: Colors.white,
            ),
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildBody(),
          _buildBottomButton()
        ],
      )
    );
  }
}


class Question{
  final String title;
  Question(this.title);
}

class RadioQuestion extends Question{
    final String desc;
    final List buttons;
    final String imgUrl;
    RadioQuestion(String title,this.imgUrl, this.desc, this.buttons):super(title);
}

class CardQuestions extends Question{
  final List<CardQuestionsModel> questions;
  CardQuestions(String title, this.questions): super(title);
}

class CardQuestionsModel{
  final String title;
  final String desc;
  CardQuestionsModel(this.title, this.desc);
}