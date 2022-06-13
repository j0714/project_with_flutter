import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/Chat/chatCS/csChatScreen.dart';
import 'package:ui_1/color/shareColor.dart';

class ChatRoomModel extends StatelessWidget {
  const ChatRoomModel(this.chatRoomTitle, {Key? key}) : super(key: key);

  final String chatRoomTitle;

  // Future<Widget> checkDepartment() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final UserDepartInfo =
  //       FirebaseFirestore.instance.collection('student').doc(user!.uid);
  //   UserDepartInfo.get().then((value) {
  //     String userDepart = value.get('userDepartment');
  //     String userDoubleMajor = value.get('userDoubleMajor');
  //     String userMinor = value.get('userMinor');
  //     if (userDepart != '컴퓨터과학과' ||
  //         userDoubleMajor != '컴퓨터과학과' ||
  //         userMinor != '컴퓨터과학과') {
  //       print('소속 학과가 아닙니다.');
  //     } else {
  //       return csChatScreen();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return csChatScreen();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey),
                top: BorderSide(color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: ColorSet.appBarColor,
                    maxRadius: 30,
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
                            chatRoomTitle,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          // Text(
                          //   widget.messageText,
                          //   style: TextStyle(
                          //     fontSize: 13,
                          //     color: Colors.grey.shade600,
                          //     fontWeight: widget.isMessageRoad
                          //         ? FontWeight.bold
                          //         : FontWeight.normal,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Text(
            //   widget.time,
            //   style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: widget.isMessageRoad
            //           ? FontWeight.bold
            //           : FontWeight.normal),
            // ),
          ],
        ),
      ),
    );
  }
}
