// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class profileDB {
  // one time profile info query
  CollectionReference profileQueryRef =
      FirebaseFirestore.instance.collection("USERS");

  // user current ID
  final userID = FirebaseAuth.instance.currentUser?.uid;
}
