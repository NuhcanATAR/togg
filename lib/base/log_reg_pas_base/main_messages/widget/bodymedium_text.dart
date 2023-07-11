import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// ignore: camel_case_types
class bodyMediumText extends StatelessWidget {
  const bodyMediumText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.black54,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodyMediumButtonText extends StatelessWidget {
  const bodyMediumButtonText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
