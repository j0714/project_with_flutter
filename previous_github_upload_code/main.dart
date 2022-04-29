import 'package:flutter/material.dart';
import 'package:ui_1/screens/login.dart';
import 'package:ui_1/screens/signup.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login with Signup',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}
