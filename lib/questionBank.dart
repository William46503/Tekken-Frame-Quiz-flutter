import 'question.dart';

class QuestionBank {
  int questionNumber;
  List<Question> _questionDB = [
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

  String getQuestionText() {
    return QuestionBank()._questionDB[questionNumber].questionText;
  }

  String getQuestionAnswer() {
    return QuestionBank()._questionDB[questionNumber].questionAnswer;
  }

  String getQuestionImageName() {
    return QuestionBank()._questionDB[questionNumber].questionImageName;
  }

  int nextQuestion() {
    questionNumber++;
    return questionNumber;
  }
}
