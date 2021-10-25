import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionOptionButton extends StatelessWidget {
  final String option;
  final VoidCallback onPressed;

  const QuestionOptionButton({
    Key? key,
    required this.option,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          option,
          style: GoogleFonts.exo(
            textStyle: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade200,
          padding: const EdgeInsets.all(12),
          elevation: 0,
        ),
      ),
    );
  }
}
