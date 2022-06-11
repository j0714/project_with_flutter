import 'package:flutter/material.dart';
import 'package:ui_1/screen/login.dart';
import 'package:ui_1/screen/passwordReset.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Privacy extends StatefulWidget {
  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  final userPasswordInfo = FirebaseAuth.instance.currentUser;
  final newUserPassword = TextEditingController();

  var _currentPass = '';
  var _newPass = '';
  var _reNewPass = '';

  void _snackBarMessage() {
    //스낵바 활용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text('Check'),
        ),
        duration: Duration(
          seconds: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating, //바닥과 공간 두는 기능
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('비밀번호 확인'),
          centerTitle: true,
          toolbarHeight: 60.0,
          backgroundColor: Color(0xff5D8AB7),
        ),
        body: Container(
          color: Color(0xffDAE0E8),
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          child: TextField(
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: '현재 비밀번호',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _currentPass = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          child: TextField(
                            controller: newUserPassword,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              hintText: '새 비밀번호 입력',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _newPass = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              hintText: '새 비밀번호 재입력',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _reNewPass = value;
                              });
                            },
                          ),
                        ),
                      ],
                    )),
              )),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    '비밀번호 업데이트',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_newPass == _reNewPass) {
                      userPasswordInfo?.updatePassword(_reNewPass);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginForm()));
                    }
                    //userPasswordInfo?.updatePassword(newUserPassword);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => LoginForm()));
                    // _currentPass.trim().isEmpty || _newPass.trim().isEmpty
                    // ? Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => LoginForm()))
                    // : _snackBarMessage();
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: TextStyle(color: Colors.blue[700]),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Privacy_detail()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
