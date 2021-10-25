import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/repositories/iquiz_repository.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/question_request.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/result_request.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/quiz_api.dart';

class QuizRepository implements IQuizRepository {
  var quizApi = QuizApi();

  @override
  Future<Quiz> getQuizAsync() async {
    var dtoQuestions = await quizApi.getQuestionsAsync();
    var questions = dtoQuestions
        .map((q) => Question(description: q.description, options: q.options))
        .toList();

    var quiz = Quiz(questions: questions);
    return quiz;
  }

  @override
  Future<Result> getResultAsync(Quiz quiz) async {
    var dtoQuestions = quiz.questions
        .map((q) => QuestionRequest(
            description: q.description, chosenOption: q.attempt!))
        .toList();

    var request = ResultRequest(questions: dtoQuestions);
    var resultDto = await quizApi.getResultAsync(request);

    return Result(percentage: resultDto.percentage, message: resultDto.message);
  }
}
