import 'dart:convert';

class QuestionResponse {
  String description;
  List<String> options;

  QuestionResponse({required this.description, required this.options});

  factory QuestionResponse.fromMap(Map<String, dynamic> map) {
    return QuestionResponse(
      description: map['description'],
      options: List<String>.from(map['options']),
    );
  }

  factory QuestionResponse.fromJson(String source) =>
      QuestionResponse.fromMap(json.decode(source));
}
