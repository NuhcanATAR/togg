import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:animate_do/animate_do.dart';

// router page
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/bodymedium_text.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/titlelarge_text.dart';
import '../../../screen/log_reg_pas/login/login.dart';

// model & database
import 'package:toggapp/base/log_reg_pas_base/password_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part '../main_messages/msg_view/sendpassend_strings.dart';

// ignore: camel_case_types
class sendMailTrueScreen extends StatefulWidget {
  const sendMailTrueScreen({super.key});

  @override
  State<sendMailTrueScreen> createState() => _sendMailTrueScreenState();
}

// ignore: camel_case_types
class _sendMailTrueScreenState
    extends MainBaseForgotPasswordState<sendMailTrueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Sıfırlama Talebi Alındı",
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
              "assets/images/app_log_reg_pass_ico/app_pass_ico/undraw_Mobile_inbox_re_ciwq.png"),
        ),
      );

  // title get widget
  Widget get titleSubTitleWidget => Column(
        children: <Widget>[
          // title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: titleLargeText(
                text: _senResPassStrings.titleText.text,
              ),
            ),
          ),
          // sub title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: bodyMediumText(
                text: _senResPassStrings.subTitleText.text,
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
                  builder: (context) => const loginScreen(),
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
              child: bodyMediumButtonText(
                text: _senResPassStrings.buttonText.text.toString(),
              ),
            ),
          ),
        ),
      );
}
