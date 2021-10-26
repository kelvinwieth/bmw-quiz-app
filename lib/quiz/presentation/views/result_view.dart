import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/widgets/result_title.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final Result result;
  const ResultView({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResultTitle(result: result);
  }
}
