import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/repositories/iquiz_repository.dart';

class FinishQuiz {
  Quiz quiz;
  IQuizRepository repository;

  FinishQuiz({required this.quiz, required this.repository});

  Future execute() async => quiz.result = await repository.getResultAsync(quiz);
}
