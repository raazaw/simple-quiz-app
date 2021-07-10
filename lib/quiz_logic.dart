import 'package:quiz_app/questions.dart';

class QuizLogic {
  List<Questions> _questions = [
    Questions(question: "Kante plays for chelsea", answer: true),
    Questions(question: "Zlatan has retired", answer: false),
    Questions(question: "Messi is 25 y/o", answer: false),
    Questions(question: "LA is in USA", answer: true),
    Questions(question: "Scotland is in the Great Britain", answer: true),
  ];

  int _questionNumber = 0;

  void changeQuestion() {
    if (_questionNumber >= 4) {
      _questionNumber = 0;
    } else {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  bool getAnswers() {
    return _questions[_questionNumber].answer;
  }
}
