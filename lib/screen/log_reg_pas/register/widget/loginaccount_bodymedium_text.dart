import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import 'package:toggapp/screen/log_reg_pas/register/register.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// ignore: camel_case_types
class loginAccountBodyMediumText extends StatelessWidget {
  const loginAccountBodyMediumText({super.key, required this.text});
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
class loginAccountBodyMediumText2 extends StatelessWidget {
  const loginAccountBodyMediumText2({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const mainRegisterFirstScreen(),
          ),
        );
      },
      child: Text(
        text,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: themeMainColorData.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
