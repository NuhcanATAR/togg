import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// router page
import 'main_messages/mainloading_routetecontrollerscreen.dart';

// model database
import '../../model/log_reg_pas_model/register_model.dart';

abstract class MainBaseUserRegisterState<T extends StatefulWidget>
    extends State<T> {
  // model
  registerModel regModel = registerModel();
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // user register firebase
  Future<void> userRegisterDB() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: regModel.mailController.text.toString(),
        password: regModel.passwordController.text.toString(),
      );

      // Kullanıcı bilgilerini Firestore'a kaydetme
      await FirebaseFirestore.instance
          .collection("USERS")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'ID': FirebaseAuth.instance.currentUser!.uid,
        'NAMESURNAME': regModel.nameSurnameController.text.toString(),
        'PHONENUMBER': regModel.phoneNumberController.text.toString(),
        'EMAIL': regModel.mailController.text.toString(),
        'PASSWORD': regModel.passwordController.text.toString(),
      });

      // Doğrulama bağlantısı gönderme
      User? userAuth = userCredential.user;
      await userAuth?.sendEmailVerification();

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const loadingRegisterRouteScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        var alertEmailAlreadyInUserDialog = AlertDialog(
          title: SizedBox(
            height: 75,
            child: Image.asset(
              "assets/images/app_log_reg_pass_ico/app_register_ico/icons8-tick-128.png",
            ),
          ),
          content: SizedBox(
            height: 100,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Email Kayıtlı!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.titleLarge!.copyWith(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "E-mail adresine daha önceden kayıtlı kullanıcı bulunmakta, lütfen başka bir email adresi giriniz.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        showDialog(
          context: context,
          builder: (context) => alertEmailAlreadyInUserDialog,
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
