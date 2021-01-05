// import 'dart:js';

import 'package:flutter/cupertino.dart';

import 'question.dart';

class QuestionBank {
  int _questionNumber = 0;

  List<Question> _questionDB = [
    Question('What happens after BLOCK? \n\n Bryan(u4) is \n\n -5 ~ -3',
        "plusFrame", 'bryanu4'),
    Question("What happens after BLOCK? \n\n Bryan(qcb3) is \n\n -13 ~ -12",
        'WSPunish', "bryanqcb3"),
    Question("What happens after On-Hit? \n\n Bryan(qcb3) is \n\n +5 ~ +6",
        'minusFrame', "bryanqcb3")
  ];

  int nextQuestion() {
    if (_questionNumber < _questionDB.length) {
      return _questionNumber++;
    }
  }

  bool checkFinish() {
    if (_questionNumber >= _questionDB.length) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }

  String getQuestionText() {
    return QuestionBank()._questionDB[_questionNumber].questionText;
  }

  String getQuestionAnswer() {
    return QuestionBank()._questionDB[_questionNumber].questionAnswer;
  }

  String getQuestionImageName() {
    return QuestionBank()._questionDB[_questionNumber].questionImageName;
  }
}
