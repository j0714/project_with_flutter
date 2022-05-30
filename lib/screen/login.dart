import 'package:flutter/material.dart';
import 'package:ui_1/screen/privacy_detail.dart';
import 'package:ui_1/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui_1/screen/homePage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '개척Talk',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          toolbarHeight: 60.0,
          backgroundColor: Color(0xff5D8AB7),
          automaticallyImplyLeading: false, // 화살표 버튼 삭제
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Color(0xffDAE0E8),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.0,
                    ),
                    Form(
                        child: Theme(
                      data: ThemeData(
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                key: ValueKey(0),
                                onSaved: (value) {
                                  userEmail = value!;
                                },
                                onChanged: (value) {
                                  userEmail = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'User Email',
                                  fillColor: Colors.grey[50],
                                  filled: true,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                key: ValueKey(00),
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: 'Password',
                                  fillColor: Colors.grey[50],
                                  filled: true,
                                ),
                              ),
                            ],
                          )),
                    )),
                    Container(
                      margin: EdgeInsets.only(
                          top: 60.0, left: 10.0, right: 10.0, bottom: 5.0),
                      width: double.infinity,
                      child: TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                                    email: userEmail, password: userPassword);

                            if (newUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
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
                    Container(
                      margin:
                          EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
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
                      margin: EdgeInsets.only(top: 20.0),
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
                    SizedBox(
                      height: 135.0,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
