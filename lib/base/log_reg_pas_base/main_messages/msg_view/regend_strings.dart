part of '../registerend_msg.dart';

// ignore: camel_case_types
enum _regEndStrings {
  titleLargeText('Hesabınızın açılması için bağlantı gönderildi!'),
  bodyMediumText(
      'TOGG Hesabınızın aktifleşmesi için kayıtlı e-mail adresinize bağlantı linki gönderilmiştir, lütfen bağlantıyı onaylayınız.'),
  loginButtonText('Giriş yapma');

  const _regEndStrings(this.text);
  final String text;
}
