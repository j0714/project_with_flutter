import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/ChatRoom/chatRoomModel.dart';

class ChatRooms extends StatelessWidget {
  const ChatRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chatRoom')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatRoomDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatRoomDocs.length,
          itemBuilder: (context, index) {
            return ChatRoomModel(
              chatRoomDocs[index]['chatRoomTitle'].toString(),
            );
          },
        );
      },
    );
  }
}