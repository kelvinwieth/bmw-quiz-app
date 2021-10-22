import 'package:bmw_quiz_flutter/quiz/domain/usecases/answerquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/getactualquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/startquiz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/quizrepository_mock.dart';

void main() {
  test('When asnwer question, question is asnwered.', () async {
    // Arrange
    var repository = QuizRepositoryMock();
    var quiz = await StartQuiz(repository: repository).execute();
    var question = GetActualQuestion(quiz: quiz).execute()!;
    var expectedIsAsnweredValue = true;

    // Act
    AnswerQuestion(question: question, attempt: 'Alemanha').execute();

    // Assert
    expect(question.isAnswered, expectedIsAsnweredValue);
  });
}
