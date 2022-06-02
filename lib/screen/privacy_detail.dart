import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/screen/new_password.dart';

class Privacy_detail extends StatefulWidget {
  @override
  State<Privacy_detail> createState() => _Privacy_detailState();
}

class _Privacy_detailState extends State<Privacy_detail> {
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
                Container(
                  height: 50.0,
                  margin: EdgeInsets.only(top: 50.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "이름",
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
                  height: 50.0,
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "이메일",
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
                      '비밀번호 업데이트',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => new_password()));
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
