import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/screen/login.dart';
import 'package:ui_1/screen/new_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Privacy_detail extends StatefulWidget {
  @override
  State<Privacy_detail> createState() => _Privacy_detailState();
}

class _Privacy_detailState extends State<Privacy_detail> {
  String sendToUserEmail = '';
  final userAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorSet.pageBackgroundColor,
        appBar: AppBar(
          title: Text('비밀번호 재설정'),
          centerTitle: true,
          toolbarHeight: 60.0,
          backgroundColor: Color(0xff5D8AB7),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Color(0xffDAE0E8),
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "비밀번호 재설정을 위해\n사용자 확인을 진행합니다.",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Text(
                    "경상국립대학교 이메일을 통해서 인증해 주세요.",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                // Container(
                //   height: 50.0,
                //   margin: EdgeInsets.only(top: 50.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: "이름",
                //       labelStyle:
                //           TextStyle(color: Colors.grey[700], fontSize: 15),
                //       enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.black),
                //       ),
                //       fillColor: Colors.grey[50],
                //       filled: true,
                //     ),
                //   ),
                // ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        if (sendToUserEmail.isEmpty) {
                          return print('empty or null');
                        } else {
                          sendToUserEmail = text;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "가입한 이메일 주소",
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      fillColor: Colors.grey[50],
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      '비밀번호 재설정 이메일 받기',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      try {
                        if (sendToUserEmail != null) {
                          userAuth.sendPasswordResetEmail(
                              email: sendToUserEmail);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      LoginForm())); //new_password에서 login페이지로 바꿈.
                          print(sendToUserEmail);
                        } else {
                          sendToUserEmail = 'false';
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
