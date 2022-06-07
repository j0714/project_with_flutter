import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_1/Notice/noticeModel.dart';


class NewNotices extends StatelessWidget {
  const NewNotices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('notice')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final noticeDocs = snapshot.data!.docs;

        return ListView.builder(
          // reverse: true,
          itemCount: noticeDocs.length,
          itemBuilder: (context, index) {
            return NoticeModel(
              noticeDocs[index]['noticeTitle'],
              noticeDocs[index]['noticeText'],
            );
          },
        );
      },
    );
  }
}
