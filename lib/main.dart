import 'dart:io';

import 'package:bmw_quiz_flutter/quiz/infra/repositories/quiz_repository.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/cubit/quiz_bloc.dart';
import 'package:bmw_quiz_flutter/quiz/presentation/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(BMWQuizApp());
}

class BMWQuizApp extends StatelessWidget {
  final QuizRepository repository;
  BMWQuizApp({Key? key})
      : repository = QuizRepository(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(repository: repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizPage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
