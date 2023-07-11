part of '../sendmailtrue_screen.dart';

// ignore: camel_case_types
enum _senResPassStrings {
  titleText('Şifre Sıfırlama E-mail gönderildi!'),
  subTitleText(
      'Sıfırlama E-maili ile şifrenizi sıfırlayabilir ve hesabınıza giriş yapabilirsiniz.'),
  buttonText('Giriş yap');

  const _senResPassStrings(this.text);

  final String text;
}
