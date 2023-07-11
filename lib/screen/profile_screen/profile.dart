// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import '../log_reg_pas/forgotpass/forgotpass.dart';
import 'package:toggapp/screen/profile_screen/sub_screens/email_upd.dart';
import 'package:toggapp/screen/profile_screen/sub_screens/namesurname_upd.dart';
import 'package:toggapp/screen/profile_screen/sub_screens/phone_upd.dart';
import 'package:toggapp/screen/main_bottommenu/main_main_bottommenu.dart';

// model & database
import 'package:toggapp/base/profile_base/base_profile.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends MainBaseProfilState<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const mainBottomMenuScreen(),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: FutureBuilder<DocumentSnapshot>(
          future: pDB.profileQueryRef.doc(pDB.userID).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildAppBarHasErrorTextWidget;
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return buildAppBarDataExistTextWidget;
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Text(
                "@${data['NAMESURNAME']}",
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: themeMainColorData.colorScheme.background,
                  ),
                ),
              );
            }

            return const Text("");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            // profile name surname & email widget
            buildProfileTopWidget,
            // name surname update widget
            buildNameSurnameUpdateButtonWidget,
            // email update widget
            buildEmailUpdateButtonWidget,
            // phone number update widget
            buildPhoneNumberUpdateButtonWidget,
            // password update widget
            buildPassUpdateButtonWidget,

            // account exit widget
            buildAccountExitButtonWidget,
          ],
        ),
      ),
    );
  }

  // profile name surname & email get widget
  Widget get buildProfileTopWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.2),
        child: Row(
          children: <Widget>[
            // profile image
            Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                    "assets/images/app_home_ico/icons8-user-96.png")),
            // profile name surname & email widget
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // name surname
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FutureBuilder<DocumentSnapshot>(
                        future: pDB.profileQueryRef.doc(pDB.userID).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                              "Hata!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text(
                              "Veri Yok!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              "${data['NAMESURNAME']}",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.titleLarge
                                    ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          return const Text("");
                        },
                      ),
                    ),
                  ),
                  // email
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: FutureBuilder<DocumentSnapshot>(
                        future: pDB.profileQueryRef.doc(pDB.userID).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                              "Hata!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text(
                              "Veri Yok!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              "${data['EMAIL']}",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            );
                          }

                          return const Text("");
                        },
                      ),
                    ),
                  ),
                  // city
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: FutureBuilder<DocumentSnapshot>(
                        future: pDB.profileQueryRef.doc(pDB.userID).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                              "Hata!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text(
                              "Veri Yok!",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              "+90 ${data['PHONENUMBER']}",
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }

                          return const Text("");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  // name surname update get widget
  Widget get buildNameSurnameUpdateButtonWidget => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const nameSurnameUPDScreen(),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Ad Soyad Güncelle",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      );
  // email update get widget
  Widget get buildEmailUpdateButtonWidget => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const emailUPDScreen(),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Email Adres Değişikliği",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      );
  // phone number update get widget
  Widget get buildPhoneNumberUpdateButtonWidget => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const phoneUPDScreen(),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Telefon Numarası Güncelle",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      );
  // password update get widget
  Widget get buildPassUpdateButtonWidget => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const mainForgotPass(),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.lock,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Şifre Yenile",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      );

  // account exit account get widget
  Widget get buildAccountExitButtonWidget => GestureDetector(
        onTap: () {
          accountExitDB();
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.exit_to_app,
                  color: Colors.redAccent,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Çıkış yap",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.redAccent,
                    size: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // appbar has error text get widget
  Widget get buildAppBarHasErrorTextWidget => Text(
        "Hata!",
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: themeMainColorData.colorScheme.background,
          ),
        ),
      );
  // appbar data exist text get widget
  Widget get buildAppBarDataExistTextWidget => Text(
        "Veri Yok!",
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: themeMainColorData.colorScheme.background,
          ),
        ),
      );
}
