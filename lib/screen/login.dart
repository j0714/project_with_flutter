import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_1/screen/passwordReset.dart';
import 'package:ui_1/screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_1/screen/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  String userPassword = '';

  // void deleteMessage() {
  //   int now = DateTime.now().month;
  //   int jonggang = DateTime.june;
  //   for (int i = 0; i < 3; i++) {
  //     if (now == jonggang) {
  //       FirebaseFirestore.instance
  //           .collection('chatCS')
  //           .doc().get().then((value) {
  //             for (DocumentSnapshot doc in snapsho) {
  //   doc.reference.delete();
  // }
  //           });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 화살표 버튼 삭제
          title: Text(
            '개척Talk',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), //AppBar 색상 변경
          ),
          centerTitle: true,
          toolbarHeight: 60.h,
          backgroundColor: Color(0xff5D8AB7),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Color(0xffDAE0E8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0), //가로여백설정
                    margin: EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey(0),
                      validator: (value) {
                        if (value!.isEmpty || value.contains('@gnu.ac.kr')) {
                          return "학교 이메일을 입력하세요";
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        userEmail = value!;
                      },
                      onChanged: (value) {
                        userEmail = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'User Email',
                        fillColor: Colors.grey[50],
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0), //가로여백설정
                    margin: EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      key: ValueKey(00),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "비밀번호는 6자리 이상";
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        userPassword = value!;
                      },
                      onChanged: (value) {
                        userPassword = value;
                      },
                      obscureText: true, //치고나면 안보이게 설정
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0)), ////외곽이 얼마나 둥글어 질껀지
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0)), //외곽이 얼마나 둥글어 질껀지
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        fillColor: Colors.grey[50],
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 60.h, left: 30.0, right: 30.0, bottom: 5.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        try {
                          final newUser =
                              await _authentication.signInWithEmailAndPassword(
                                  email: userEmail, password: userPassword);
                          final userAuth =
                              await FirebaseAuth.instance.currentUser!;

                          if (!userAuth.emailVerified) {
                            print("이메일 인증을 하세요");
                          } else {
                            if (newUser != null) {
                              //deleteMessage();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              print('로그인 확인');
                            }
                          }

                          // if (newUser != null) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HomePage()));
                          // }
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
                  Container(
                    margin: EdgeInsets.only(top: 5.h, left: 30.0, right: 30.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Signup()));
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        '비밀번호를 잊으셨나요?',
                        style: TextStyle(color: Colors.blue[700]),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Privacy_detail()));
                      },
                    ),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
