import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/repositories/iquiz_repository.dart';

class StartQuiz {
  IQuizRepository repository;

  StartQuiz({required this.repository});

  Future<Quiz> execute() async => await repository.getQuizAsync();
}
