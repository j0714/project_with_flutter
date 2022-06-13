import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_1/Notice/noticePage.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/screen/homePage.dart';

class NoticeModel extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  NoticeModel(this.noticeTitle, this.noticeText, this.userName, this.noticeTime,
      {Key? key})
      : super(key: key);

  final String noticeTitle;
  final String noticeText;
  final String userName;
  final String noticeTime;
  String userCode = '';

  void inputCode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            width: 150,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  // Icons.check_circle,
                  Icons.warning_amber_outlined,
                  size: 50,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '공지사항 코드를 쓰세요',
                  style: TextStyle(
                    // color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child : TextField(
                    onChanged: (value) {
                      userCode = value;
                    },
                  ),
                ),
                GestureDetector(
                  //onTap: _tryValidation,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 60.0, left: 30.0, right: 30.0, bottom: 0.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // );
                        Navigator.pop(context);
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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

    // void _deleteNotice() async {
    //   if (userCode == '') {
    //     inputCode(context);
    //   }
    //   final user = FirebaseAuth.instance.currentUser;
    //   final UserNotice1 = await FirebaseFirestore.instance
    //       .collection('notice')
    //       .doc(user!.uid + userCode);
    //   UserNotice1.get().then((value) {
    //     String uidCode = value.get('uidcode');
    //     String curUidCod = user.uid + value.get('code');
    //     if (curUidCod == uidCode) {
    //       final delNotiec =
    //           FirebaseFirestore.instance.collection('notice').doc(uidCode);
    //       delNotiec.delete();
    //       print('삭제');
    //     }
    //   });
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
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  if (userCode == '') {
                    inputCode(context);
                  }
                  final user = FirebaseAuth.instance.currentUser;
                  final UserNotice1 = FirebaseFirestore.instance
                      .collection('notice')
                      .doc(user!.uid + userCode);
                  UserNotice1.get().then((value) {
                    String uidCode = value.get('uidcode');
                    String curUidCod = user.uid + value.get('code');
                    if (curUidCod == uidCode) {
                      final delNotiec = FirebaseFirestore.instance
                          .collection('notice')
                          .doc(uidCode);
                      delNotiec.delete();
                      print('삭제');
                    }
                  });
                  // _deleteNotice();
                },
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
                      GetX<Controller>(
                        builder: (_) => CircleAvatar(
                          backgroundColor: controller.noticecolor().color1,
                          maxRadius: 20,
                        ),
                      ),
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
                FutureBuilder(
                  future: _visible(),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return IconButton(
                        onPressed: _showBottomSheet,
                        icon: Icon(Icons.more_horiz),
                      );
                    } else
                      return Container(); //return 값 아무거나 주려고
                  },
                ),
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
