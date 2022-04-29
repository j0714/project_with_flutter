import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_1/screens/signup.dart';

class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('개척Talk', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        toolbarHeight: 60.0,
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
                SizedBox(height: 200.0,),
                // Text('Login', style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //     fontSize: 30.0),
                // ),
                // SizedBox(height: 10.0,),
                // Image.asset("assets/images/사진.png",
                //   height: 150.0,
                //   width: 150.0,
                //   // color: Colors.transparent,  //사진 숨기는 코드
                // ),
                // SizedBox(height: 10.0,),
                // Text('Sample Code',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black38,
                //     fontSize: 25.0),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextFormField(
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
                      hintText: 'User Id',
                      fillColor: Colors.grey[50],
                      filled: true,
                    ),
                  ),
                ),
                Container(
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
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      fillColor: Colors.grey[50],
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0, left:30.0, right: 30.0, bottom: 5.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Login',
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
                  margin: EdgeInsets.only(top: 5.0, left:30.0, right: 30.0, bottom: 30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_)=> Signup()));
                    },

                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(height: 200.0,),
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text('Does not have account?'),
                //       FlatButton(
                //         textColor: Colors.blue,
                //           child: Text('Sign up'),
                //         onPressed: (){
                //           Navigator.push(context,
                //               MaterialPageRoute(builder: (_)=> SignupForm()));
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        )

      ),

    );

  }
}
