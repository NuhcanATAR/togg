import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:firebase_auth/firebase_auth.dart';

// router page
import '../../screen/log_reg_pas/login/login.dart';

// model & database
import '../../model/log_reg_pas_model/login_model.dart';

abstract class MainBaseLoginState<T extends StatefulWidget> extends State<T> {
  // model
  loginModel logModel = loginModel();
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // login firebase auth
  Future<void> loginDB() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: logModel.emailController.text.toString(),
        password: logModel.passwordController.text.toString(),
      );

      User? user = userCredential.user;

      if (!user!.emailVerified) {
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'E-postanızı doğrulamadan giriş yapamazsınız.',
        );
      }

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const loginRouterScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        userNotFound();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      } else if (e.code == 'too-many-requests') {
        tooManyRequest();
      } else if (e.code == 'email-not-verified') {
        requiresrecentlogin();
      }
    }
  }

  void userNotFound() {
    var alertUserNotFoundDialog = AlertDialog(
      content: SizedBox(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                  "assets/images/app_log_reg_pass_ico/app_login_ico/icons8-wrong-96.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "E-mail Adresi veya Şifre Hatalı",
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Bilgileriniz yanlış, Lütfen tekrar deneyiniz.",
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alertUserNotFoundDialog);
  }

  void wrongPassword() {
    var alertWrongPasswordDialog = AlertDialog(
      content: SizedBox(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                  "assets/images/app_log_reg_pass_ico/app_login_ico/icons8-wrong-96.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "E-mail Adresi veya Şifre Hatalı",
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Bilgileriniz yanlış, Lütfen tekrar deneyiniz.",
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (context) => alertWrongPasswordDialog);
  }

  void tooManyRequest() {
    var alertTooManyRequestDialog = AlertDialog(
      content: SizedBox(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                  "assets/images/app_log_reg_pass_ico/app_login_ico/icons8-banned-96.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Çok fazla hatalı giriş",
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Çok fazla hatalı giriş yaptınız, hesabınız askıya alındı, şifrenizi sıfırlayabilir veya bi süre sonra tekrar deneyebilirsiniz.",
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (context) => alertTooManyRequestDialog);
  }

  void requiresrecentlogin() {
    var alertrequiresrecentloginDialog = AlertDialog(
      content: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                  "assets/images/app_log_reg_pass_ico/app_login_ico/icons8-email-open-96.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "E-mail Adresinizi Doğrulayınız",
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Email adresinizi doğrulamadınız,lütfen gönderilen maili onaylayarak giriş yapabilirsiniz.",
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (context) => alertrequiresrecentloginDialog);
  }
}
