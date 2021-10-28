import 'dart:convert';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/question_response.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/result_request.dart';
import 'package:bmw_quiz_flutter/quiz/infra/datasources/dtos/result_response.dart';
import 'package:http/http.dart' as http;

class QuizApi {
  var baseUrl = 'http://10.0.2.2:5000/api/Quiz';

  QuizApi({required bool isDeviceBrowser}) {
    if (isDeviceBrowser) {
      baseUrl = 'http://localhost:5000/api/Quiz';
    }
  }

  Future<List<QuestionResponse>> getQuestionsAsync() async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url).timeout(const Duration(seconds: 30));

    var decodedBody = jsonDecode(response.body) as List;

    return Future.delayed(const Duration(seconds: 3), () {
      return decodedBody.map((item) => QuestionResponse.fromMap(item)).toList();
    });
  }

  Future<ResultResponse> getResultAsync(ResultRequest request) async {
    var url = Uri.parse(baseUrl);
    var response = await http.post(
      url,
      body: request.toJson(),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 30));

    var json = jsonDecode(response.body);
    return ResultResponse.fromMap(json);
  }
}
