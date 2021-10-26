import 'package:bmw_quiz_flutter/quiz/domain/entities/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultTitle extends StatelessWidget {
  final Result result;
  const ResultTitle({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${result.percentage.toStringAsFixed(1)}%',
            textAlign: TextAlign.center,
            style: GoogleFonts.exo(
              textStyle: const TextStyle(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            result.message,
            textAlign: TextAlign.center,
            style: GoogleFonts.exo(
              textStyle: const TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
