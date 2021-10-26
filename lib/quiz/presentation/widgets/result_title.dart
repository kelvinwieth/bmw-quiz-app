import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/styles/quiz_styles.dart';
import 'package:flutter/material.dart';

class ResultTitle extends StatelessWidget {
  final Result result;
  const ResultTitle({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${result.percentage.toStringAsFixed(0)}%',
            textAlign: TextAlign.center,
            style: QuizStyles().resultPercentageTextStyle,
          ),
          const SizedBox(height: 10),
          Text(
            result.message,
            textAlign: TextAlign.center,
            style: QuizStyles().resultMessageTextStyle,
          ),
        ],
      ),
    );
  }
}
