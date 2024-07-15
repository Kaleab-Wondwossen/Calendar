import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/my_chat_bubble.dart';
import '../services/FireStore/fire_store.dart';
import '../services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("iamadmin@gmail.com"),
      ),
      body: Column(
        children: [
          //messages
          Expanded(
            child: _buildMessageList(),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    FireStoreServices searchServies = FireStoreServices();
    return FutureBuilder<String?>(
      future: searchServies.searchUserUIDByEmail("iamadmin@gmail.com"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          //String? verificationCode = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display verification code at the top
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     ' $verificationCode',
              //     style: const TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              Expanded(
                child: _buildMessageListView(),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildMessageListView() {
    return StreamBuilder(
      stream: _chatServices.getMessages(
        "qOKnO7ffQYPnwA7N98M4yURQbH33",
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //message List Builder
  //message item builder
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    Color bubbleColor = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? const Color.fromARGB(255, 228, 183, 235)
        : const Color.fromARGB(255, 245, 222, 174);

    // Convert timestamp to DateTime
    DateTime timestamp = (data['timestamp'] as Timestamp).toDate();

    // Format DateTime to a readable format
    String formattedDateTime =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(timestamp);

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            // Text(data['senderEmail']),
            const SizedBox(
              height: 10,
            ),
            ChatBubble(
              messages: data['message'],
              bubbleColor: bubbleColor,
            ),
            Text(
              formattedDateTime, // Display formatted date and time
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
