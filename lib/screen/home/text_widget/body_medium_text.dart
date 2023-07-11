import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// ignore: camel_case_types
class bodyMediumTextGrey extends StatelessWidget {
  const bodyMediumTextGrey({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodyMediumTextBlack extends StatelessWidget {
  const bodyMediumTextBlack({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodyMediumTextWhite extends StatelessWidget {
  const bodyMediumTextWhite({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          shadows: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 1),
              blurRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodyMediumTextWhiteBold extends StatelessWidget {
  const bodyMediumTextWhiteBold({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 1),
              blurRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
