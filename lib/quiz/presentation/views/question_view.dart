import 'package:bmw_quiz_flutter/quiz/domain/entities/question.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionView extends StatelessWidget {
  final Question question;
  const QuestionView({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(question.description),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (_, index) {
                  String option = question.options[index];

                  return ElevatedButton(
                    onPressed: () => context.read<QuizCubit>().answer(option),
                    child: Text(option),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
