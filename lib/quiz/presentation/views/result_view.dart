import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final Result result;
  const ResultView({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${result.percentage}: ${result.message}'),
    );
  }
}
