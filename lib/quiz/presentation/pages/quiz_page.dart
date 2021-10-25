import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_bloc.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<QuizCubit>().start();

    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        debugPrint('$state');

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: const Center(
            child: Text('Quiz!'),
          ),
        );
      },
    );
  }
}
