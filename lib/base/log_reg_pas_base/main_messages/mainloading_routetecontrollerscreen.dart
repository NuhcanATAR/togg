import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// router page
import 'package:toggapp/base/log_reg_pas_base/main_messages/sendmailfalse_screen.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/sendmailtrue_screen.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/registerend_msg.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// kayıt sonu kontrol ekranı
// ignore: camel_case_types
class loadingRegisterRouteScreen extends StatefulWidget {
  const loadingRegisterRouteScreen({super.key});

  @override
  State<loadingRegisterRouteScreen> createState() =>
      _loadingRegisterRouteScreenState();
}

// ignore: camel_case_types
class _loadingRegisterRouteScreenState
    extends State<loadingRegisterRouteScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const mainregisterendMsgScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadingAnimationWidget.beat(
              color: themeMainColorData.colorScheme.background,
              size: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Lütfen Bekleyiniz...",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.titleMedium!.copyWith(
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// girşi ekranı kontrol yüklemen ekranı yeri

// şifre sıfırlama kontrol ekranı

// şifre doğruysa

// ignore: camel_case_types
class loadingSendMailTrueRouteScren extends StatefulWidget {
  const loadingSendMailTrueRouteScren({super.key});

  @override
  State<loadingSendMailTrueRouteScren> createState() =>
      _loadingSendMailTrueRouteScrenState();
}

// ignore: camel_case_types
class _loadingSendMailTrueRouteScrenState
    extends State<loadingSendMailTrueRouteScren> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const sendMailTrueScreen(),
          ),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadingAnimationWidget.beat(
              color: themeMainColorData.colorScheme.background,
              size: 55,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Email Kontrol Ediliyor",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lütfen Bekleyiniz...",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// şifre yanlışsa

// ignore: camel_case_types
class loadingSendMailFalseRouteScreen extends StatefulWidget {
  const loadingSendMailFalseRouteScreen({super.key});

  @override
  State<loadingSendMailFalseRouteScreen> createState() =>
      _loadingSendMailFalseRouteScreenState();
}

// ignore: camel_case_types
class _loadingSendMailFalseRouteScreenState
    extends State<loadingSendMailFalseRouteScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const sendMailFalseScreen(),
          ),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadingAnimationWidget.beat(
              color: themeMainColorData.colorScheme.background,
              size: 55,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Email Kontrol Ediliyor",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lütfen Bekleyiniz...",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
