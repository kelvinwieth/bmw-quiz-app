import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_state.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/styles/quiz_styles.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/views/loading_view.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/views/question_view.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        Widget? child;

        if (state is InitialState) {
          context.read<QuizCubit>().start();
          child = const Center(
            child: QuizLoadingIndicator(),
          );
        }

        if (state is LoadingState) {
          child = const Center(
            child: QuizLoadingIndicator(),
          );
        }

        if (state is LoadedState) {
          child = QuestionView(question: state.displayQuestion);
        }

        if (state is ErrorState) {
          child = Center(
            child: Text(state.message),
          );
        }

        if (state is FinishedState) {
          child = ResultView(result: state.quiz.result!);
        }

        return Scaffold(
          appBar: QuizStyles().quizAppBar,
          body: Container(
            alignment: Alignment.center,
            child: child,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('images/bmw2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3),
                    BlendMode.dstATop,
                  )),
            ),
          ),
        );
      },
    );
  }
}
