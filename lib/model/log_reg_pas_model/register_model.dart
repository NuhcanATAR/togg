// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class registerModel {
  // form key
  final formRegisterKey = GlobalKey<FormState>();

  // controller
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  // validator

  // name surname validator
  String? nameSurnameValidator(String? nameSurnameVal) {
    if (nameSurnameVal == null || nameSurnameVal.isEmpty) {
      return "* Zorunlu alan";
    }
    return null;
  }

  // email validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "* Zorunlu alan";
    }
    return null;
  }

  // phone number validator
  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "* Zorunlu alan";
    } else if (phoneNumberVal[0] == "0") {
      return "* Geçersiz Numara";
    } else if (phoneNumberVal.length < 10) {
      return "* Geçersiz Numara";
    } else if (phoneNumberVal.length > 10) {
      return "* Geçersiz Numara";
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
