import 'package:bmw_quiz_flutter/quiz/domain/repositories/iquiz_repository.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/answerquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/finishquiz.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/getactualquestion.dart';
import 'package:bmw_quiz_flutter/quiz/domain/usecases/startquiz.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<QuizState> {
  IQuizRepository repository;

  QuizCubit({required this.repository}) : super(InitialState());

  void start() async {
    // try {
    emit(LoadingState());

    var quiz = await StartQuiz(repository: repository).execute();
    var displayQuestion = GetActualQuestion(quiz: quiz).execute();

    emit(LoadedState(quiz: quiz, displayQuestion: displayQuestion!));
    // } catch (e) {
    //   emit(ErrorState(e));
    // }
  }

  void _nextQuestion() {
    // try {
    var quiz = (state as LoadedState).quiz;
    var displayQuestion = GetActualQuestion(quiz: quiz).execute();

    if (displayQuestion == null) {
      _finish();
    } else {
      emit(LoadedState(quiz: quiz, displayQuestion: displayQuestion));
    }

    // } catch (e) {
    //   emit(ErrorState(e));
    // }
  }

  void answer(String attempt) {
    // try {
    var question = (state as LoadedState).displayQuestion;
    AnswerQuestion(question: question, attempt: attempt).execute();

    debugPrint('${question.description} => ${question.attempt}');

    _nextQuestion();
    // } catch (e) {
    //   emit(ErrorState(e));
    // }
  }

  void _finish() async {
    // try {
    var quiz = (state as LoadedState).quiz;

    await FinishQuiz(quiz: quiz, repository: repository).execute();

    emit(FinishedState(quiz: quiz));
    // } catch (e) {
    //   emit(ErrorState(e));
    // }
  }
}
