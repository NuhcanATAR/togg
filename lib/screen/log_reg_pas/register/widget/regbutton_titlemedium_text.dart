import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// ignore: camel_case_types
class titleRegisterButtonMediumText extends StatelessWidget {
  const titleRegisterButtonMediumText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.titleMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
