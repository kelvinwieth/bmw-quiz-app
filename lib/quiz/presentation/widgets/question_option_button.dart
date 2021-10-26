import 'package:bmw_quiz_flutter/quiz/presentation/styles/quiz_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionOptionButton extends StatelessWidget {
  final String option;
  final VoidCallback onPressed;

  const QuestionOptionButton({
    Key? key,
    required this.option,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          option,
          style: QuizStyles().optionButtonTextStyle,
        ),
        style: QuizStyles().questionOptionButtonStyle,
      ),
    );
  }
}
