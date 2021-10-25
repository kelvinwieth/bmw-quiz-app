import 'package:bmw_quiz_flutter/quiz/domain/usecases/finishquiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/startquiz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/quizrepository_mock.dart';

void main() {
  test('When finish quiz, quiz result has value.', () async {
    // Arrange
    var repository = QuizRepositoryMock();
    var quiz = await StartQuiz(repository: repository).execute();

    // Act
    await FinishQuiz(quiz: quiz, repository: repository).execute();

    // Assert
    expect(quiz.result == null, false);
  });
}
