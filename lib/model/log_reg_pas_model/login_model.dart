// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginModel {
  // form key
  final formLoginKey = GlobalKey<FormState>();

  // controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // validator

  // email validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "* Zorunlu alan";
    }
    return null;
  }

  // password validator
  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "* Zorunlu alan";
    }
    return null;
  }
}
