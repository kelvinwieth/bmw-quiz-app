import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/styles/quiz_styles.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/widgets/result_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultView extends StatelessWidget {
  final Result result;
  const ResultView({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultTitle(result: result),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => BlocProvider.of<QuizCubit>(context).start(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Text(
                'Reiniciar',
                style: QuizStyles().optionButtonTextStyle,
              ),
            ),
            style: QuizStyles().questionOptionButtonStyle,
          ),
        ],
      ),
    );
  }
}
