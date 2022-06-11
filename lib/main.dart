import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/screen/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //TabController? controller;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '개척-Talk',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginForm(),
        );
      },
    );
  }
}
