import 'question.dart';
import 'result.dart';

class Quiz {
  final List<Question> questions;
  Result? result;

  Quiz({required this.questions});
}
