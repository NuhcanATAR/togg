import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class largeTitleText extends StatelessWidget {
  const largeTitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.titleLarge?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
