import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  var _addTitle = '';
  var _addText = '';

  void _snackBarMessage() {  //스낵바 활용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text('Done'),
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

  void _sendNotice() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('notice').add({
      'noticeTitle': _addTitle,
      'noticeText': _addText,
      'time': Timestamp.now(),
      'dateTime': Timestamp.now().toDate().toString(),
      'userName': userData.data()!['userName'],
    });
    Navigator.pop(context);
    _snackBarMessage();
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
          backgroundColor: ColorSet.appBarColor,
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
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New Notice',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Scaffold(
          backgroundColor: ColorSet.pageBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    // key: ValueKey(1),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please write title!';
                    //   } else
                    //     return null;
                    // },
                    // onSaved: (value) {
                    //   _addTitle = value!;
                    // },
                    onChanged: (value) {
                      // _addTitle = value;
                      setState(() {
                        _addTitle = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Notice title',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    // key: ValueKey(2),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please write notice!';
                    //   } else
                    //     return null;
                    // },
                    // onSaved: (value) {
                    //   _addText = value!;
                    // },
                    onChanged: (value) {
                      _addText = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Write notice',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 20,
                  ),
                  SizedBox(height: 20),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        // onTap: _addText.trim().isEmpty || _addTitle.trim().isEmpty ? null : (){}
                        onTap:
                            _addTitle.trim().isEmpty || _addText.trim().isEmpty
                                ? null
                                : _sendNotice,
                        // onTap: _sendNotice,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // color: ColorSet.appBarColor),
                            color: _addTitle.trim().isEmpty ||
                                    _addText.trim().isEmpty
                                ? Colors.grey
                                : ColorSet.appBarColor,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Add Notice',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
