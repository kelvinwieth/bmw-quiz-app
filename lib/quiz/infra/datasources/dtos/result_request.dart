import 'dart:convert';

import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/question_request.dart';

class ResultRequest {
  List<QuestionRequest> questions;

  ResultRequest({required this.questions});

  Map<String, dynamic> toMap() {
    return {
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
