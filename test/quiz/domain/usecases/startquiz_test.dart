import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/startquiz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/quizrepository_mock.dart';

void main() {
  test('When Quiz starts, Quiz contains all questions', () async {
    // Arrange
    var repository = QuizRepositoryMock();
    var useCase = StartQuiz(repository: repository);
    var expectedQuestionsLength = repository.questions.length;

    // Act
    Quiz quiz = await useCase.execute();

    // Assert
    expect(quiz.questions.length, expectedQuestionsLength);
  });
}
