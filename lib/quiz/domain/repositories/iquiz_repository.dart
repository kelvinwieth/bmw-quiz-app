import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';

abstract class IQuizRepository {
  Future<Quiz> getQuizAsync();
  Future<Result> getResultAsync(Quiz quiz);
}
