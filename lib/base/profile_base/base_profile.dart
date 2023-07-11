import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// router page
import 'package:toggapp/screen/log_reg_pas/login/login.dart';

// model & database
import '../../database/profile_db/profiledb.dart';
import '../../model/profile_model/model_profile.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

abstract class MainBaseProfilState<T extends StatefulWidget> extends State<T> {
  // model & database
  modelProfile pModel = modelProfile();
  profileDB pDB = profileDB();

  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // user update database
  Future<void> nameSurnameUPDdb() async {
    await FirebaseFirestore.instance
        .collection("USERS")
        .doc(pDB.userID)
        .update({
      "NAMESURNAME": pModel.nameSurnameController.text.toString(),
    }).whenComplete(() {
      pModel.nameSurnameController.clear();
      var alertUpdMsgDialog = AlertDialog(
        title: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.task_alt,
                color: themeMainColorData.colorScheme.background,
                size: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Text(
                    "Güncelleme Başarılı!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            "Ad Soyad Başarıyla Güncellendi.",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyLarge?.copyWith(
                color: Colors.black54,
              ),
            ),
          ),
        ),
      );
      showDialog(context: context, builder: (context) => alertUpdMsgDialog);
    }).catchError((err) {
      var alertUpdErrMsgDialog = AlertDialog(
        title: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error,
                color: Colors.redAccent,
                size: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Text(
                    "Güncelleme Hata!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Text(
          "Ad Soyad Güncellenemedi!",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyLarge?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      );
      showDialog(context: context, builder: (context) => alertUpdErrMsgDialog);
    });
  }

  Future<void> phoneNumberUPDdb() async {
    await FirebaseFirestore.instance
        .collection("USERS")
        .doc(pDB.userID)
        .update({
      "PHONENUMBER": pModel.phoneNumberController.text.toString(),
    }).whenComplete(() {
      pModel.phoneNumberController.clear();
      var alertUpdMsgDialog = AlertDialog(
        title: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.task_alt,
                color: themeMainColorData.colorScheme.background,
                size: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Text(
                    "Güncelleme Başarılı!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            "Telefon Numaranız Başarıyla Güncellendi.",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyLarge?.copyWith(
                color: Colors.black54,
              ),
            ),
          ),
        ),
      );
      showDialog(context: context, builder: (context) => alertUpdMsgDialog);
    }).catchError((err) {
      var alertUpdErrMsgDialog = AlertDialog(
        title: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error,
                color: Colors.redAccent,
                size: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Text(
                    "Güncelleme Hata!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Text(
          "Telefon Numaranız Güncellenemedi!",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyLarge?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      );
      showDialog(context: context, builder: (context) => alertUpdErrMsgDialog);
    });
  }

  Future<void> accountExitDB() async {
    await FirebaseAuth.instance.signOut().whenComplete(() => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const loginScreen(),
              ),
              (Route<dynamic> route) => false),
        });
  }
}
