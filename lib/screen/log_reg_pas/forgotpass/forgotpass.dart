import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import 'package:toggapp/screen/log_reg_pas/forgotpass/widget/body_medium_text.dart';
import 'package:toggapp/screen/log_reg_pas/forgotpass/widget/button_text.dart';
import 'package:toggapp/screen/log_reg_pas/forgotpass/widget/large_title_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/login.dart';

// model & database
import '../../../base/log_reg_pas_base/password_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part '../forgotpass/forgotpass_view/forgotpass_strings.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const mainForgotPass(),
  );
}

// ignore: camel_case_types
class mainForgotPass extends StatelessWidget {
  const mainForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: forgotPasswordScreen(),
    );
  }
}

// ignore: camel_case_types
class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({super.key});

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

// ignore: camel_case_types
class _forgotPasswordScreenState
    extends MainBaseForgotPasswordState<forgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const loginScreen(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: Text(
          "Şifre unuttum",
          style: GoogleFonts.nunito(
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: themeMainColorData.colorScheme.background,
                ),
          ),
        ),
      ),
      body: Form(
        key: passModel.formPassSendKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              // title & sub title widget
              buildTitleSubTitleWidget,
              // input widget
              buildEmailinputWidget,
              // send button widget
              buildResetPassSendButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // title & sub title get widget
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          // title widget
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: largeTitleText(
                text: _forgotpassStrings.titleText.text,
              ),
            ),
          ),
          // sub title
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: bodyMediumText(
                text: _forgotpassStrings.subTitleText.text,
              ),
            ),
          ),
        ],
      );

  // input get widget
  Widget get buildEmailinputWidget => Column(
        children: <Widget>[
          // email input
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20),
              child: bodyMediuminputText(
                text: _forgotpassStrings.emailinputText.text.toString(),
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
                controller: passModel.emailController,
                validator: passModel.emailValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ornek@gmail.com",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ],
      );

  // sen button get widget
  Widget get buildResetPassSendButtonWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            if (passModel.formPassSendKey.currentState!.validate()) {
              resetPassDb();
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
              child: titlePassSendMailButtonMediumText(
                text: _forgotpassStrings.sendMailButtonText.text.toString(),
              ),
            ),
          ),
        ),
      );
}
