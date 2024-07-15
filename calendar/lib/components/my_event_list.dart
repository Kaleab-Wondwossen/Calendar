import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_card_builder.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Events').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data!.docs;

          // Get the current user ID
          final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
          final String currentUserId = firebaseAuth.currentUser!.uid;

          // Filter documents to include only those with the correct user ID
          List<DocumentSnapshot> userDocuments = documents.where((document) {
            bool isCurrentUserEvent = document['ID'] == currentUserId;
            return isCurrentUserEvent;
          }).toList();

          // Sort documents by eventDate in ascending order
          userDocuments.sort((a, b) {
            DateTime eventDateA = DateTime.parse(a['Date']);
            DateTime eventDateB = DateTime.parse(b['Date']);
            return eventDateA.compareTo(eventDateB);
          });

          return Padding(
            padding: const EdgeInsets.only(
                left: 0), // Adjust the left padding as needed
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: userDocuments.map((document) {
                String id = document['EventTitle'];
                String message = document['EventDescription'];
                DateTime eventDate = DateTime.parse(document['Date']);
                String docID = document.id;
                String date = document['Date'];

                // Calculate days difference
                int daysDifference =
                    eventDate.difference(DateTime.now()).inDays;

                // Determine color based on days difference
                Color color;
                if (daysDifference <= 5) {
                  color = const Color.fromARGB(255, 233, 176, 64);
                } else if (daysDifference <= 15) {
                  color = const Color.fromARGB(255, 233, 176, 64);
                } else {
                  color = const Color.fromARGB(255, 98, 201, 102);
                }

                return CardBuilder(
                  title: id,
                  description: message,
                  color: color,
                  docId: docID,
                  date: date,
                );
              }).toList(),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
