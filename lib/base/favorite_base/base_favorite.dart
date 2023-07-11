import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MainBaseFavoriteState<T extends StatefulWidget>
    extends State<T> {
  // screen size
  double dynmaicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  // favorite
  Stream<List<Map<String, dynamic>>> getFavoriteCarsByUserIdStream(
      String userId) {
    return FirebaseFirestore.instance
        .collection('FAVORITE')
        .where('USERID', isEqualTo: userId)
        .snapshots()
        .asyncMap((favoritesSnapshot) async {
      if (favoritesSnapshot.size == 0) {
        return [];
      }

      final List<String> aracIds =
          favoritesSnapshot.docs.map((doc) => doc['CARID'] as String).toList();

      final QuerySnapshot carsSnapshot = await FirebaseFirestore.instance
          .collection('CARS')
          .where(FieldPath.documentId, whereIn: aracIds)
          .orderBy(FieldPath.documentId)
          .get();

      if (carsSnapshot.docs.isNotEmpty) {
        return carsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        return [];
      }
    });
  }
}
