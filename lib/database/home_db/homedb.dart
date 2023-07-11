// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class homeServiceDB {
  // one time profile info query
  CollectionReference homeProfilDbRef =
      FirebaseFirestore.instance.collection("USERS");

  final userID = FirebaseAuth.instance.currentUser!.uid;

  // models list query
  final Stream<QuerySnapshot> modelListQuery =
      FirebaseFirestore.instance.collection("MODELS").snapshots();

  // car list query
  final Stream<QuerySnapshot> carListQuery =
      FirebaseFirestore.instance.collection("CARS").snapshots();
}
