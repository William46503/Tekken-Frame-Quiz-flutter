class Question {
  String questionText;
  String questionImageName;
  String questionAnswer;

  Question({String q, String a, String picname}) {
    questionText = q;
    questionAnswer = a;
    questionImageName =
        picname; //Naming images: character + move-input, fexp: EWGF -> kazuyafddf2
  }
}
