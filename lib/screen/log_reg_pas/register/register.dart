import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import '../login/widget/large_title_text.dart';
import '../login/widget/title_medium_text.dart';
import '../../../base/log_reg_pas_base/main_messages/widget/bodymedium_text.dart';
import 'package:toggapp/screen/log_reg_pas/login/login.dart';
import 'package:toggapp/screen/log_reg_pas/login/widget/logbutton_titlemedium_text.dart';

// model & database
import 'package:toggapp/base/log_reg_pas_base/register_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part '../register/register_view/register_strings.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const mainRegisterFirstScreen(),
  );
}

// ignore: camel_case_types
class mainRegisterFirstScreen extends StatelessWidget {
  const mainRegisterFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: registerFirstScreen(),
    );
  }
}

// ignore: camel_case_types
class registerFirstScreen extends StatefulWidget {
  const registerFirstScreen({super.key});

  @override
  State<registerFirstScreen> createState() => _registerFirstScreenState();
}

// ignore: camel_case_types
class _registerFirstScreenState
    extends MainBaseUserRegisterState<registerFirstScreen> {
  late String carrierEmail = regModel.mailController.text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
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
          "E-mail Adres",
          style: GoogleFonts.nunito(
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: themeMainColorData.colorScheme.background,
                ),
          ),
        ),
      ),
      body: Form(
        key: regModel.formRegisterKey,
        child: buildMainBodyWidget,
      ),
    );
  }

  // build main body get widget
  Widget get buildMainBodyWidget => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          // build body widget
          buildBodyWidget,
          // footer register button widget
          buildFooterButtonWidget,
        ],
      ));

  // build body get widget
  Widget get buildBodyWidget => Positioned(
        left: 8.0,
        right: 8.0,
        bottom: 0,
        top: 0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              // title & sub title
              buildTitleSubTitleWidget,
              // email input widget
              emailinputsWidget
            ],
          ),
        ),
      );

  // title & sub title get widget
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          // title
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: LargeTitleText(
                text: _registerStrings.verificationTitleText.text.toString(),
              ),
            ),
          ),

          // sub title
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: titleMediumText(
              text: _registerStrings.verificationSubTitleText.text.toString(),
            ),
          ),
        ],
      );

  // email input get widget
  Widget get emailinputsWidget => Column(
        children: <Widget>[
          // name surname
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 35),
              child: bodyMediumText(
                text: _registerStrings.inputnameSurnameText.text.toString(),
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
                controller: regModel.nameSurnameController,
                validator: regModel.nameSurnameValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Adınız Soyadınız*",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
// email input
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20),
              child: bodyMediumText(
                text: _registerStrings.emailText.text.toString(),
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
                controller: regModel.mailController,
                validator: regModel.emailValidator,
                onChanged: (valueNew) {
                  setState(() {
                    carrierEmail = valueNew;
                  });
                },
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

          // phone number inputs
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 15),
              child: bodyMediumText(
                text: _registerStrings.inputPhoneNumberText.text.toString(),
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
                controller: regModel.phoneNumberController,
                validator: regModel.phoneNumberValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Telefon Numaranız",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ),

          // password inputs
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 15),
              child: bodyMediumText(
                text: _registerStrings.inputPasswordText.text.toString(),
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
                keyboardType: TextInputType.visiblePassword,
                controller: regModel.passwordController,
                validator: regModel.passwordValidator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Şifreniz",
                  hintStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      );
  // footer register button get widget
  Widget get buildFooterButtonWidget => Positioned(
        bottom: 15,
        left: 10,
        right: 10,
        child: GestureDetector(
          onTap: () {
            if (regModel.formRegisterKey.currentState!.validate()) {
              userRegisterDB();
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.07),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeMainColorData.colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: titleLoginButtonMediumText(
                text:
                    _registerStrings.nextEmailVerificationText.text.toString(),
              ),
            ),
          ),
        ),
      );
}
