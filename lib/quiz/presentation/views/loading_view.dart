import 'package:flutter/material.dart';

class QuizLoadingIndicator extends StatelessWidget {
  const QuizLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }
}
