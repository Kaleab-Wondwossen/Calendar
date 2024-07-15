import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsServices extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessages(String userId) {
    String ids = userId; 

    return _firestore
        .collection('events_rooms')
        .doc(ids)
        .collection('events')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
