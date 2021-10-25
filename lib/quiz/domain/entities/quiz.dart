import 'package:equatable/equatable.dart';

import 'question.dart';
import 'result.dart';

class Quiz extends Equatable {
  final List<Question> questions;
  Result? result;

  Quiz({required this.questions});

  @override
  List<Object?> get props => [questions, result];
}
