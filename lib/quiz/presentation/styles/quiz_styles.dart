import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizStyles {
  final resultMessageStyle = GoogleFonts.exo(
    textStyle: const TextStyle(
      fontSize: 40,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
    ),
  );

  final optionTextStyle = GoogleFonts.exo(
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    ),
  );

  final resultPercentageStyle = GoogleFonts.exo(
    textStyle: const TextStyle(
      fontSize: 60,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  );

  final quizAppBar = AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'BMW Quiz',
      style: GoogleFonts.exo(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
