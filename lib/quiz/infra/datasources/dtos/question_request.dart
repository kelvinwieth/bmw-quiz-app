import 'dart:convert';

class QuestionRequest {
  String description;
  String chosenOption;

  QuestionRequest({required this.description, required this.chosenOption});

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'chosenOption': chosenOption,
    };
  }

  String toJson() => json.encode(toMap());
}
