// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Do you Tekken?'),
          backgroundColor: Colors.red.shade900,
        ),
        backgroundColor: Color(0xff341513),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  String userAnswer = "";

  Icon rightAnswer() {
    return Icon(Icons.check, color: Colors.green.shade600);
  }

  Icon wrongAnswer() {
    return Icon(Icons.close, color: Colors.red.shade600);
  }

  //Original lists of data before creating the class--------------------
  // List<String> questionText = [
  //   "What happens after BLOCK? \n\n Bryan(u4) is \n\n -5 ~ -3",
  //   "What happens after BLOCK? \n\n Bryan(qcb3) is \n\n -13 ~ -12",
  //   "What happens after On-Hit? \n\n Bryan(qcb3) is \n\n +5 ~ +6 "
  // ];
  //
  // List<String> questionImageName = ['bryanu4', "bryanqcb3", 'bryanqcb3'];
  //
  // List<String> questionAnswer = ["plusFrame", 'WSPunish', "minusFrame"];

  List<Question> questionDB = [
    Question(
        q: "What happens after BLOCK? \n\n Bryan(u4) is \n\n -5 ~ -3",
        a: "plusFrame",
        picname: 'bryanu4'),
    Question(
        q: "What happens after BLOCK? \n\n Bryan(qcb3) is \n\n -13 ~ -12",
        a: 'WSPunish',
        picname: "bryanqcb3"),
    Question(
        q: "What happens after On-Hit? \n\n Bryan(qcb3) is \n\n +5 ~ +6",
        a: 'minusFrame',
        picname: "bryanqcb3")
  ];

  bool checkAnswer(String userAnswer) {
    if (userAnswer == questionDB[questionNumber].questionAnswer) {
      print('User got it right');
      scoreKeeper.add(rightAnswer());
      return true;
    } else {
      print("User got it wrong");
      scoreKeeper.add(wrongAnswer());
      return false;
    }
  }

  int nextQuestion() {
    setState(() {
      questionNumber++;
    });
    return questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Center(
              child: Container(
                child: Text(
                  questionDB[questionNumber].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
          child: Container(
            child: Image(
              image: AssetImage(
                  'assets/${questionDB[questionNumber].questionImageName}.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: FlatButton(
                        height: 45,
                        textColor: Color(0xffF2F2F2),
                        color: Colors.red.shade800,
                        child: Text(
                          'Slightly  - frame',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          print('User picked: minusframe');
                          userAnswer = 'minusFrame';
                          checkAnswer(userAnswer);
                          nextQuestion();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: FlatButton(
                        height: 45,
                        textColor: Color(0xffF2F2F2),
                        color: Colors.green.shade900,
                        child: Text(
                          'Slightly  + frame',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          print('User picked: plusframe');
                          userAnswer = 'plusFrame';
                          checkAnswer(userAnswer);
                          nextQuestion();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          height: 45,
                          textColor: Color(0xff2e7d32),
                          color: Color(0xffdd2c00),
                          child: Text(
                            'Jab Punish',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () {
                            print('User picked: jabpunish');
                            userAnswer = 'jabPunish';
                            checkAnswer(userAnswer);
                            nextQuestion();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          height: 45,
                          textColor: Color(0xffF2F2F2),
                          color: Color(0xff1565c0),
                          child: Text(
                            'Launch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            print('User picked: launch');
                            userAnswer = 'launchPunish';
                            checkAnswer(userAnswer);
                            nextQuestion();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          height: 45,
                          textColor: Color(0xffF2F2F2),
                          color: Color(0xffff3d00),
                          child: Text(
                            'WS Punish',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () {
                            print('User picked: wspunish');
                            userAnswer = 'WSPunish';
                            checkAnswer(userAnswer);
                            nextQuestion();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.white38,
          indent: 50,
          endIndent: 50,
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
