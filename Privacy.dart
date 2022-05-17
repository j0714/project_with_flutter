
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비밀번호 확인'),
        centerTitle: true,
        toolbarHeight: 60.0,
        backgroundColor: Color(0xff5D8AB7),
      ),
      body: Container(
        color: Color(0xffDAE0E8),
        child: Column(
          children: [
            Container(height: 40.0,),
            // Container(
            //   color: Color(0xffDAE0E8),
            //   padding: EdgeInsets.symmetric(horizontal: 20.0),
            //   child: Text('회원님의 소중한 정보 보호를 위해, 현재 비밀번호를 확인해 주세요.',
            //     style: TextStyle(fontSize: 18.0),),
            // ),
            // Container(
            //   height: 50.0,
            //   color: Colors.white38,
            //   margin: EdgeInsets.only(top: 10.0),
            //   child: Text('2018010826@gnu.ac.kr',
            //     style: TextStyle(fontSize: 18.0, color:Colors.grey[700])),
            // ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                obscureText: true,     //치고나면 안보이게 설정
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: '현재 비밀번호',
                  fillColor: Colors.grey[50],
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                obscureText: true,     //치고나면 안보이게 설정
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),   ////외곽이 얼마나 둥글어 질껀지
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),  //외곽이 얼마나 둥글어 질껀지
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  hintText: '새 비밀번호',
                  fillColor: Colors.grey[50],
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                obscureText: true,     //치고나면 안보이게 설정
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),   ////외곽이 얼마나 둥글어 질껀지
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),  //외곽이 얼마나 둥글어 질껀지
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  hintText: '새 비밀번호 재입력',
                  fillColor: Colors.grey[50],
                  filled: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left:30.0, right: 30.0, bottom: 5.0),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  '비밀번호 업데이트',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){},

              ),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left:30.0, right: 30.0, bottom: 10.0),
              width: double.infinity,
              child: Text(
                  '비밀번호를 잊으셨나요?',
                  style: TextStyle(color: Colors.blue[700]), textAlign: TextAlign.center,
                ),
              ),
          ],
        ), // Container(
            //   height: 50.0,
            //   padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
            //   margin: EdgeInsets.only(top: 10.0),
            //   child: TextField(
            //     autofocus: true,
            //     cursorColor: Colors.blue,
            //   ),
            //   )
      ),
    );
  }
}
