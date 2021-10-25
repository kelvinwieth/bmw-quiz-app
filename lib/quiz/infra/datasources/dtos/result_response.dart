import 'dart:convert';

class ResultResponse {
  double percentage;
  String message;

  ResultResponse({required this.percentage, required this.message});

  factory ResultResponse.fromMap(Map<String, dynamic> map) {
    return ResultResponse(
      percentage: map['percentage'],
      message: map['message'],
    );
  }

  factory ResultResponse.fromJson(String source) =>
      ResultResponse.fromMap(json.decode(source));
}
