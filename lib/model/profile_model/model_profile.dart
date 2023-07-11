import 'package:flutter/material.dart';

// ignore: camel_case_types
class modelProfile {
  // form key
  final formSaveKey = GlobalKey<FormState>();

  // controller
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // validator
  String? nameSurnameValidator(String? nameSurnameVal) {
    if (nameSurnameVal == null || nameSurnameVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }
}
