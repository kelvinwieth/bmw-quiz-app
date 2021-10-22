import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:bmw_quiz_flutter/quiz/domain/repositories/iquiz_repository.dart';

class QuizRepositoryMock implements IQuizRepository {
  List<Question> questions = [];
  List<String> defaultOptions = ['Alemanha', 'Inglaterra', 'Japão', 'USA'];

  QuizRepositoryMock() {
    questions = [
      Question(description: 'BMW', options: List.from(defaultOptions)),
      Question(description: 'Toyota', options: List.from(defaultOptions)),
      Question(description: 'Rolls-Royce', options: List.from(defaultOptions)),
    ];
  }

  @override
  Future<Quiz> getQuizAsync() async {
    return Quiz(questions: questions);
  }

  @override
  Future<Result> getResultAsync(Quiz quiz) async {
    return Result(percentage: 100.toDouble(), message: 'Parabéns!');
  }
}
