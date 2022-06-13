import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui_1/screen/homePage.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  var _addTitle = '';
  var _addText = '';
  var _Code = '';

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //꼭 버튼 클릭하게 하는 조건
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text("Warning!"),
          content: Text("Content is not saved."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Continue'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _snackBarMessage() {
    //스낵바 활용
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

  void _titleEmptyMessage() {
    //스낵바 활용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text('Please Write Title!'),
        ),
        duration: Duration(
          seconds: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating, //바닥과 공간 두는 기능
      ),
    );
  }

  void _textEmptyMessage() {
    //스낵바 활용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text('Please Write Text!'),
        ),
        duration: Duration(
          seconds: 5,
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
        .collection('admin')
        .doc(user!.uid)
        .get();

    final UserNotice =
        FirebaseFirestore.instance.collection('notice').doc(user.uid + _Code);
    UserNotice.get().then((value) {
      UserNotice.set({
        'noticeTitle': _addTitle,
        'noticeText': _addText,
        'time': Timestamp.now(),
        'dateTime': Timestamp.now().toDate().toString(),
        'userName': userData.data()!['userName'],
        'code': _Code,
        'uidcode': user.uid + _Code,
      });
    });

    // FirebaseFirestore.instance.collection('notice').add(
    //   {
    //     'noticeTitle': _addTitle,
    //     'noticeText': _addText,
    //     'time': Timestamp.now(),
    //     'dateTime': Timestamp.now().toDate().toString(),
    //     'userName': userData.data()!['userName'],
    //     'code': _Code,
    //   },
    // );
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
                      _addTitle.trim().isEmpty && _addText.trim().isEmpty && _Code.trim().isEmpty
                          ? Navigator.pop(context)
                          : _showAlert(context);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_addTitle.trim().isEmpty &&
                              _addText.trim().isEmpty) {
                            return null;
                          } else if (_addText.trim().isEmpty) {
                            return _textEmptyMessage();
                          } else if (_addTitle.trim().isEmpty) {
                            return _titleEmptyMessage();
                          } else
                            return _sendNotice();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: ColorSet.appBarColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Add Notice',
                                style: TextStyle(
                                  color: ColorSet.appBarColor,
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
        body: Scaffold(
          backgroundColor: ColorSet.pageBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          _addTitle = value;
                        });
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Notice title',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: ColorSet.pageBackgroundColor),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))),
                      child: TextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          _Code = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'input Code',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: ColorSet.pageBackgroundColor),
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))),
                      child: TextField(
                        onChanged: (value) {
                          _addText = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Write notice',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: ColorSet.pageBackgroundColor,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
