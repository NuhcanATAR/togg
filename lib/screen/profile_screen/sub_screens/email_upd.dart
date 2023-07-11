// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// theme data
import '../../../theme/mainthemecolor.dart';

class emailUPDScreen extends StatefulWidget {
  const emailUPDScreen({super.key});

  @override
  State<emailUPDScreen> createState() => _emailUPDScreenState();
}

class _emailUPDScreenState extends State<emailUPDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: Text(
          "Email Adres Değişikliği",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // image widget
              buildimgWidget,
              // title widget
              buildTitleWidget,
              // sub title widget
              buildSubTitleWidget,
            ],
          ),
        ),
      ),
    );
  }

  // image get widget
  Widget get buildimgWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
            "assets/images/app_profile_ico/undraw_Personal_email_re_4lx7.png"),
      );
  // title get widget
  Widget get buildTitleWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Email Adresi Değiştirilemez",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.titleLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  // sub title get widget
  Widget get buildSubTitleWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "TOGG Hesabınıza Kayıtlı Email Adresi Değiştirilemez.",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      );
}
