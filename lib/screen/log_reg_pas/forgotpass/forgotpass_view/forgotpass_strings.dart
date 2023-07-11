part of '../forgotpass.dart';

// ignore: camel_case_types
enum _forgotpassStrings {
  titleText('Şifrenizimi unuttunuz?'),
  subTitleText(
      'TOGG hesabınızın şifresinimi unuttunuz, kayıtlı e-mail adresiniz ile şifrenizi güncelleyebilirsiniz.'),
  emailinputText('Email Adresiniz *'),
  sendMailButtonText('Gönder');

  final String text;
  const _forgotpassStrings(this.text);
}
