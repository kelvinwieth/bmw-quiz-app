import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';

class AnswerQuestion {
  Question? question;
  String attempt;

  AnswerQuestion({required this.question, required this.attempt});

  void execute() {
    if (question == null) {
      return;
    }

    question!.choseOption(attempt);
  }
}
