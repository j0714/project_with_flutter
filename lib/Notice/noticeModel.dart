import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_1/color/shareColor.dart';

class NoticeModel extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  NoticeModel(
      this.noticeTitle, this.noticeText, this.userName, this.noticeTime,
      {Key? key})
      : super(key: key);

  final String noticeTitle;
  final String noticeText;
  final String userName;
  final String noticeTime;

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    // stream: FirebaseFirestore.instance
    //     .collection('notice')
    //     .orderBy('time', descending: true)
    //     .snapshots(),
    // builder: (context,
    //     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   final doc = snapshot.data!.docs;

    Future<bool> _visible() async {
      FocusScope.of(context).unfocus();
      final user = FirebaseAuth.instance.currentUser;
      final userData = await FirebaseFirestore.instance
          .collection('admin')
          .doc(user!.uid)
          .get();
      bool value = (userData.data()?['userName'] != null);
      return value;
    }

    // void _deleteNotice() {
    //   // final doc = FirebaseFirestore.instance.collection('notice').snapshots();
    //   final doc = FirebaseFirestore.instance
    //       .collection('notice')
    //       .orderBy('time', descending: true)
    //       .snapshots();
    //   // final docs = doc.data().;
    //   // final documnets = doc.data!().;/
    //   // FirebaseFirestore.instance.collection('notice').doc(doc.doc).delete();
    //   final docs = doc.doc(doc);
    //   DocumentReference doc_ref =
    //       FirebaseFirestore.instance.collection("notice").doc();
    //   FirebaseFirestore.instance.collection('notice').doc('doc_ref').delete();
    // }

    void _showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Edit'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {},
              ),
            ],
          ));
        },
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70, // 이게 배경색입니다.
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      GetX<Controller>(builder:(_)=>CircleAvatar(
                        backgroundColor: controller.noticecolor().color1,
                        maxRadius: 20,
                      ),),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userName,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                noticeTime,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _showBottomSheet,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noticeTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noticeText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
