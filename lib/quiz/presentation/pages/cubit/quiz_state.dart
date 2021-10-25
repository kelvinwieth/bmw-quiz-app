import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';
import 'package:bmw_quiz_flutter/quiz/domain/entities/quiz.dart';
import 'package:equatable/equatable.dart';

class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends QuizState {}

class LoadingState extends QuizState {}

class LoadedState extends QuizState {
  final Quiz quiz;
  final Question displayQuestion;

  LoadedState({required this.quiz, required this.displayQuestion});

  @override
  List<Object?> get props => super.props + [quiz];
}

class FinishedState extends QuizState {
  final Quiz quiz;

  FinishedState({required this.quiz});

  @override
  List<Object?> get props => super.props + [quiz];
}

class ErrorState extends QuizState {
  final String message = 'Erro ao iniciar quiz. Tente novamente.';
}
