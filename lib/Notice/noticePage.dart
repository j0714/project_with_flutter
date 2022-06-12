import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/Notice/notice.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/Notice/addNotice.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  Widget _addNoticeButton() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorSet.appBarColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            'Add New',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorSet.pageBackgroundColor,
        appBar: AppBar(
          elevation: 0, //AppBar 그림자 없애기
          backgroundColor: ColorSet.pageBackgroundColor,
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Notice',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: _visible(),
                        builder: (context, snapshot) {
                          if (snapshot.data == true) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => AddNotice())));
                              },
                              child: _addNoticeButton(),
                            );
                          } else
                            return Container(); //return 값 아무거나 주려고
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 165, 111, 111),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: NewNotices(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
