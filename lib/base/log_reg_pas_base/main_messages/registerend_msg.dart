import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

// router page
import 'package:toggapp/screen/log_reg_pas/login/login.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/bodymedium_text.dart';
import 'package:toggapp/base/log_reg_pas_base/main_messages/widget/titlelarge_text.dart';

// model database
import 'package:toggapp/base/log_reg_pas_base/register_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part 'msg_view/regend_strings.dart';

void main() {
  runApp(
    const mainregisterendMsgScreen(),
  );
}

// ignore: camel_case_types
class mainregisterendMsgScreen extends StatelessWidget {
  const mainregisterendMsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: registerendMsgScreen(),
    );
  }
}

// ignore: camel_case_types
class registerendMsgScreen extends StatefulWidget {
  const registerendMsgScreen({super.key});

  @override
  State<registerendMsgScreen> createState() => _registerendMsgScreenState();
}

// ignore: camel_case_types
class _registerendMsgScreenState
    extends MainBaseUserRegisterState<registerendMsgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Hesabınız Oluşturuldu!",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium!.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                // image widget
                buildimageWidget,
                // title text
                buildTitleTextWidget,
                // sub title
                buildSubTitleTextWidget,
                // login button
                buildLoginButtonWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // image get widget
  Widget get buildimageWidget => FadeInDown(
        duration: const Duration(
          seconds: 1,
        ),
        child: SizedBox(
          width: dynamicWidth(0.30),
          height: dynamicHeight(0.12),
          child: Image.asset(
              "assets/images/app_log_reg_pass_ico/app_register_ico/icons8-tick-128.png"),
        ),
      );

  // title text get widget
  Widget get buildTitleTextWidget => FadeInUp(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: titleLargeText(
            text: _regEndStrings.titleLargeText.text.toString(),
          ),
        ),
      );

  // sub title text get widget
  Widget get buildSubTitleTextWidget => FadeInUp(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 15),
          child: bodyMediumText(
            text: _regEndStrings.bodyMediumText.text.toString(),
          ),
        ),
      );

  // login button get widget
  Widget get buildLoginButtonWidget => FadeInUp(
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
                text: _regEndStrings.loginButtonText.text.toString(),
              ),
            ),
          ),
        ),
      );
}
