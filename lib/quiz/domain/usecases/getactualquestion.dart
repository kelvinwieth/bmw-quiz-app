import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';

class GetActualQuestion {
  Quiz quiz;

  GetActualQuestion({required this.quiz});

  Question? execute() {
    try {
      return quiz.questions.firstWhere((q) => q.isNotAnswered);
    } on StateError {
      return null;
    }
  }
}
