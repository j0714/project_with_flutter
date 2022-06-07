import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'csMessage.dart';
import 'csNewMessage.dart';

class csChatScreen extends StatefulWidget {
  const csChatScreen({Key? key}) : super(key: key);

  @override
  State<csChatScreen> createState() => _csChatScreenState();
}

class _csChatScreenState extends State<csChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? LoggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurruntUser();
  }

  void getCurruntUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        LoggedUser = user;
        print(LoggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CS'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [Expanded(child: csMessage()), csNewMessage()],
        ),
      ),
    );
  }
}
