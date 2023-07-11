import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// router page
import '../../main_bottommenu/main_main_bottommenu.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/body_medium_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/forgotpassword_bodymedium.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/large_title_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/logbutton_titlemedium_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/newaccount_bodymedium_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/title_medium_text.dart';

// model & database
import '../../../base/log_reg_pas_base/login_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part 'login_view/login_strings.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends MainBaseLoginState<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: logModel.formLoginKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                // title sub title widget
                LargeTitleText(text: _loginStrings.titleText.text.toString()),
                titleMediumText(
                    text: _loginStrings.subTitleText.text.toString()),
                // inputs widget
                buildinputWidgets,
                // forgot password widget
                buildForgotPassWidget,
                // login button
                buildLoginButtonWidget,
                // create account
                buildNewAccountButtonWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get buildinputWidgets => Column(
        children: <Widget>[
          // email input
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: bodyMediumText(
                text: _loginStrings.inputMailText.text.toString(),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.8,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                controller: logModel.emailController,
                validator: logModel.emailValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ornek@gmail.com*",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),

          // password inputs
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: bodyMediumText(
                text: _loginStrings.inputPasswordText.text.toString(),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.8,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                obscureText: true,
                controller: logModel.passwordController,
                validator: logModel.passwordValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Şifreniz",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
          ),
        ],
      );

  Widget get buildForgotPassWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            bodyMediumForgotPassText(
              text: _loginStrings.forgotpasswordText.text.toString(),
            ),
          ],
        ),
      );

  Widget get buildLoginButtonWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            if (logModel.formLoginKey.currentState!.validate()) {
              loginDB();
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.08),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeMainColorData.colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: titleLoginButtonMediumText(
                text: _loginStrings.loginButtonText.text.toString(),
              ),
            ),
          ),
        ),
      );

  Widget get buildNewAccountButtonWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 40),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: newAccountBodyMediumText(
                    text: _loginStrings.newAccountButtonText.text.toString(),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: newAccountBodyMediumText2(
                    text: _loginStrings.newAccountButtonText2.text.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

// router screen

// ignore: camel_case_types
class loginRouterScreen extends StatefulWidget {
  const loginRouterScreen({super.key});

  @override
  State<loginRouterScreen> createState() => _loginRouterScreenState();
}

// ignore: camel_case_types
class _loginRouterScreenState extends State<loginRouterScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const mainBottomMenuScreen(),
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
                color: themeMainColorData.colorScheme.background, size: 65),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Bilgiler Kontrol ediliyor",
              textAlign: TextAlign.center,
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
              textAlign: TextAlign.center,
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
