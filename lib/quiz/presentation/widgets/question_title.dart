import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTitle extends StatelessWidget {
  final String title;

  const QuestionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Text(
        'Qual a origem da $title?',
        textAlign: TextAlign.center,
        style: GoogleFonts.exo(
          textStyle: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
