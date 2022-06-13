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
  final usertest = FirebaseFirestore.instance;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Testing', //여기는 이제 단체 채팅방 이름을 넣으면 됨
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            // decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: csMessage(),
                ),
                csNewMessage(),
                // SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
