import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import '../../forgotpass/forgotpass.dart';

// ignore: camel_case_types
class bodyMediumForgotPassText extends StatelessWidget {
  const bodyMediumForgotPassText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const mainForgotPass(),
          ),
        );
      },
      child: Text(
        text,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: const Color.fromARGB(255, 28, 53, 67),
          ),
        ),
      ),
    );
  }
}
