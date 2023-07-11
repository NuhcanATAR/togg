// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class passwordModel {
  // form key
  final formPassSendKey = GlobalKey<FormState>();
  // controller
  TextEditingController emailController = TextEditingController();

  // validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "* Zorunlu Alan";
    }
    return null;
  }
}
