import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_bloc.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        debugPrint('$state');
        Widget? child;

        if (state is InitialState) {
          context.read<QuizCubit>().start();
        }

        if (state is LoadingState) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LoadedState) {
          child = Column(
            children: [
              Text(state.displayQuestion.description),
              Expanded(
                child: ListView.builder(
                  itemCount: state.displayQuestion.options.length,
                  itemBuilder: (_, id) {
                    return ElevatedButton(
                      onPressed: () => context
                          .read<QuizCubit>()
                          .answer(state.displayQuestion.options[id]),
                      child: Text(
                        state.displayQuestion.options[id],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }

        if (state is ErrorState) {
          child = Center(
            child: Text(state.message),
          );
        }

        if (state is FinishedState) {
          child = Center(
            child: Text(
                '${state.quiz.result!.percentage}: ${state.quiz.result!.message}'),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: Center(
            child: child,
          ),
        );
      },
    );
  }
}
