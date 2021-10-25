import 'dart:convert';

import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/question_response.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/result_request.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/result_response.dart';
import 'package:http/http.dart' as http;

class QuizApi {
  var baseUrl = 'https://localhost:5001/api/Quiz';
  var client = http.Client();

  Future<List<QuestionResponse>> getQuestionsAsync() async {
    try {
      var url = Uri.parse(baseUrl);
      var response = await client.get(url);

      var decodedBody = jsonDecode(response.body) as List<Map<String, dynamic>>;

      return decodedBody.map((item) => QuestionResponse.fromMap(item)).toList();
    } finally {
      client.close();
    }
  }

  Future<ResultResponse> getResultAsync(ResultRequest request) async {
    try {
      var url = Uri.parse(baseUrl);
      var response = await client.post(url, body: request.toMap());

      return ResultResponse.fromJson(response.body);
    } finally {
      client.close();
    }
  }
}
