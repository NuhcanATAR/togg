import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class bodyMediumText extends StatelessWidget {
  const bodyMediumText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: const Color.fromARGB(255, 28, 53, 67),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodyMediuminputText extends StatelessWidget {
  const bodyMediuminputText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: const Color.fromARGB(255, 28, 53, 67),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
