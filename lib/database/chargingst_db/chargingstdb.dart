// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class chargingstDB {
  // chargin station list query (A-Z)
  final Stream<QuerySnapshot> chargingStQueryAZ = FirebaseFirestore.instance
      .collection("STATIONS")
      .orderBy("ADRESS")
      .snapshots();

  // charging type 1 list query
  final Stream<QuerySnapshot> charginType1Query = FirebaseFirestore.instance
      .collection("STATIONS")
      .where("CHARGINGTYPE", isEqualTo: "DC Yüksek Hızlı Sarj")
      .snapshots();

  // charging type 2 list query
  final Stream<QuerySnapshot> charginType2Query = FirebaseFirestore.instance
      .collection("STATIONS")
      .where("CHARGINGTYPE", isEqualTo: "AC Hızlı Sarj")
      .snapshots();
}
