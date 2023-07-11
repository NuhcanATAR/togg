import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_auth/firebase_auth.dart';

// router page
import 'main_messages/mainloading_routetecontrollerscreen.dart';

// model & database
import '../../model/log_reg_pas_model/password_model.dart';

abstract class MainBaseForgotPasswordState<T extends StatefulWidget>
    extends State<T> {
  // model
  passwordModel passModel = passwordModel();
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // password reset firebase auth
  Future<void> resetPassDb() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(
            email: passModel.emailController.text.toString())
        .then((value) => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loadingSendMailTrueRouteScren(),
                  ),
                  (Route<dynamic> router) => false),
            })
        .catchError((err) => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const loadingSendMailFalseRouteScreen(),
                  ),
                  (Route<dynamic> router) => false),
            });
  }
}
