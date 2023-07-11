import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LargeTitleText extends StatelessWidget {
  const LargeTitleText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.titleLarge?.copyWith(
          color: const Color.fromARGB(255, 28, 53, 67),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
