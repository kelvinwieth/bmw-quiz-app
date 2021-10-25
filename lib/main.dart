import 'package:bmw_quiz_flutter/quiz/presentation/pages/quiz_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMWQuizApp());
}

class BMWQuizApp extends StatelessWidget {
  const BMWQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
