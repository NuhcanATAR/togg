import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// pub dev
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// model & database
import '../../database/home_db/homedb.dart';
import '../../model/home_model/mode_home.dart';

abstract class MainBaseHomeState<T extends StatefulWidget> extends State<T> {
  // database & model
  homeServiceDB serviceDB = homeServiceDB();
  homeModelService modelService = homeModelService();
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.width * value;

  // url google play application
  final Uri googlePlayURL = Uri.parse(
      "https://play.google.com/store/apps/details?id=com.togg.toggmobile&hl=en_US");
  Future<void> launchURL() async {
    if (!await launchUrl(googlePlayURL)) {
      throw Exception("URL Adres Hatası: $googlePlayURL");
    }
  }

  // search
  List<QueryDocumentSnapshot> searchCarList = [];

  Future<QuerySnapshot> searchCars(String searchTerm) {
    String searchKey = searchTerm.substring(0, searchTerm.length - 1);
    String endKey = searchTerm.substring(0, searchTerm.length - 1) +
        String.fromCharCode(searchTerm.codeUnitAt(searchTerm.length - 1) + 1);

    return FirebaseFirestore.instance
        .collection("CARS")
        .orderBy("CARNAME")
        .startAt([searchKey]).endAt([endKey]).get();
  }
}
