import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

// model & database
import '../../model/chargingstation_model/chargingstation_model.dart';
import '../../database/chargingst_db/chargingstdb.dart';

abstract class MainBaseChargingStationState<T extends StatefulWidget>
    extends State<T> {
  // model & database
  chargingstationModel cModel = chargingstationModel();
  chargingstDB cDb = chargingstDB();
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // search

  List<QueryDocumentSnapshot> searchChargingList = [];

  Future<QuerySnapshot> searchCharging(String searchTerm) {
    String searchKey = searchTerm.substring(0, searchTerm.length - 1);
    String endKey = searchTerm.substring(0, searchTerm.length - 1) +
        String.fromCharCode(searchTerm.codeUnitAt(searchTerm.length - 1) + 1);

    return FirebaseFirestore.instance
        .collection("STATIONS")
        .orderBy("CITY")
        .startAt([searchKey]).endAt([endKey]).get();
  }
}
