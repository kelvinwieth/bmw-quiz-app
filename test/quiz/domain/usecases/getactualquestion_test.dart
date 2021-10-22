import 'package:bmw_quiz_flutter/quiz/domain/usecases/answerquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/getactualquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/startquiz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/quizrepository_mock.dart';

void main() {
  test(
    'After quiz starts, when get actual question, question is first from repository.',
    () async {
      // Arrange
      var repository = QuizRepositoryMock();
      var quiz = await StartQuiz(repository: repository).execute();
      var expectedQuestion = quiz.questions.first;

      // Act
      var actualQuestion = GetActualQuestion(quiz: quiz).execute();

      // Assert
      expect(actualQuestion, expectedQuestion);
    },
  );

  test(
    'When answer a question, actual question is the next',
    () async {
      // Arrange
      var repository = QuizRepositoryMock();
      var quiz = await StartQuiz(repository: repository).execute();
      var firstQuestion = GetActualQuestion(quiz: quiz).execute();
      AnswerQuestion(question: firstQuestion, attempt: 'Inglaterra').execute();
      var expectedQuestion = quiz.questions.skip(1).take(1).first;

      // Act
      var actualQuestion = GetActualQuestion(quiz: quiz).execute();

      // Assert
      expect(actualQuestion, expectedQuestion);
    },
  );

  test(
    'When answer all questions, actual question is null',
    () async {
      // Arrage
      var repository = QuizRepositoryMock();
      var quiz = await StartQuiz(repository: repository).execute();
      var question = GetActualQuestion(quiz: quiz).execute();

      // Act
      for (int i = 0; i < repository.questions.length; i++) {
        AnswerQuestion(question: question, attempt: 'Inglaterra').execute();
        question = GetActualQuestion(quiz: quiz).execute();
      }

      // Assert
      expect(question, null);
    },
  );
}
