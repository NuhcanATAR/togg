part of '../register.dart';

// ignore: camel_case_types
enum _registerStrings {
  verificationTitleText('Başlamadan Önce Lütfen E-mail Adresinizi Giriniz'),
  verificationSubTitleText(
      'TOGG hesabınız için e-mail adresinizi girmeniz gerekiyor'),

  inputnameSurnameText('Adınız Soyadınız*'),
  inputPhoneNumberText('Telefon Numaranız*'),
  emailText('Email Adresiniz'),
  inputPasswordText('Şifreniz*'),
  nextEmailVerificationText('Devam et');

  const _registerStrings(this.text);

  final String text;
}
