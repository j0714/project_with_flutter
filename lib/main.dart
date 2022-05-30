import 'package:flutter/material.dart';
import 'package:ui_1/screen/login.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  TabController? controller;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '개척-Talk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}
