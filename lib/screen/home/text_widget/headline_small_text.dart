// ignore: camel_case_types

import 'package:kartal/kartal.dart';

// pub dev
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class headlineSmallWhiteText extends StatelessWidget {
  const headlineSmallWhiteText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                blurRadius: 1.0,
              ),
            ]),
      ),
    );
  }
}
