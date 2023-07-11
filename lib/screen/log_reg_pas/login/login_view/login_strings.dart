part of '../login.dart';

// ignore: camel_case_types
enum _loginStrings {
  titleText('TOGG Uygulamasına Hoşgeldiniz.'),
  subTitleText('Devam etmek için TOGG hesabınıza giriş \nyapınız.'),

  inputMailText('Email Adresiniz*'),
  inputPasswordText('Şifreniz*'),
  forgotpasswordText('Şifremi unuttum!'),
  loginButtonText('Giriş yap'),
  newAccountButtonText('Henüz hesabınız yokmu?'),
  newAccountButtonText2('Hesap oluştur');

  const _loginStrings(this.text);

  final String text;
}
