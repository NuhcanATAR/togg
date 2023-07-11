import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:animate_do/animate_do.dart';

// router page
import '../../../screen/log_reg_pas/forgotpass/forgotpass.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/bodymedium_text.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/titlelarge_text.dart';

// model & database
import 'package:toggapp/base/log_reg_pas_base/password_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// ignore: camel_case_types
class sendMailFalseScreen extends StatefulWidget {
  const sendMailFalseScreen({super.key});

  @override
  State<sendMailFalseScreen> createState() => _sendMailFalseScreenState();
}

// ignore: camel_case_types
class _sendMailFalseScreenState
    extends MainBaseForgotPasswordState<sendMailFalseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Hata!",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            // image widget
            imageWidget,
            // title & sub title widget
            titleSubTitleWidget,

            // login button widget
            loginButtonWidget,
          ],
        ),
      ),
    );
  }

  // image get widget
  Widget get imageWidget => FadeInDown(
        duration: const Duration(seconds: 1),
        child: SizedBox(
          height: 170,
          child: Image.asset(
              "assets/images/app_log_reg_pass_ico/app_pass_ico/undraw_access_denied_re_awnf.png"),
        ),
      );

  // title get widget
  Widget get titleSubTitleWidget => Column(
        children: <Widget>[
          // title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: titleLargeText(
                text: "Email Adresi Hatalı",
              ),
            ),
          ),
          // sub title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: bodyMediumText(
                text:
                    "Girmiş olduğunuz email adresi hatalı lütfen email adresinizi kontrol ediniz.",
              ),
            ),
          ),
        ],
      );

  // login button get widget
  Widget get loginButtonWidget => FadeInUp(
        duration: const Duration(
          seconds: 1,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const mainForgotPass(),
                ),
                (Route<dynamic> route) => false);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicWidth(0.12),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeMainColorData.colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: const bodyMediumButtonText(
                text: "Tekrar Dene",
              ),
            ),
          ),
        ),
      );
}
