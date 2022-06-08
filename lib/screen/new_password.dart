import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/screen/login.dart';

class new_password extends StatefulWidget {
  @override
  State<new_password> createState() => _new_password_detailState();
}

class _new_password_detailState extends State<new_password> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 재설정'),
        centerTitle: true,
        toolbarHeight: 60.0,
        backgroundColor: Color(0xff5D8AB7),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Color(0xffDAE0E8),
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text(
                  "새 비밀번호 만들기",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Text(
                  "6자 이상의 새 비밀번호를 만드세요.\n영문, 숫자, 특수기호를 함께 사용하면 보안 수진이 높은 비밀번호를 만들 수 있습니다.",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.only(top: 50.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "새 비밀번호 입력",
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
                    '비밀번호 변경',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginForm()));
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(
                height: 255.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
