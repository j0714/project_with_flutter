import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui_1/screen/homePage.dart';

class AddChatRoom extends StatefulWidget {
  const AddChatRoom({Key? key}) : super(key: key);

  @override
  State<AddChatRoom> createState() => _AddChatRoomState();
}

class _AddChatRoomState extends State<AddChatRoom> {
  var _semester = '';
  var _department = '';
  var _grade = '';

  final _semesterList = ['22년 1학기', '22년 2학기'];
  final _departmentList = [
    '생명과학부',
    '물리학과',
    '수학과',
    '식품영양학과',
    '의료학과',
    '정보통계학과',
    '지질과학과',
    '컴퓨터과학과',
    '화학과',
    '제약공학과',
    '항나노신소재과학과',
  ];
  final _gradeList = [
    '1학년',
    '2학년',
    '3학년',
    '4학년',
  ];

  var _selectedSemseter, _selectedDepartment, _selectedGrade;

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

  void _checkMessage() {
    //스낵바 활용
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text('Please Check Elements!'),
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

  void _createChatRoom() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('admin')
        .doc(user!.uid)
        .get();
    var _addTitle = _semester + ' ' + _department + ' ' + _grade + ' ' + '단톡방';
    // FirebaseFirestore.instance.collection('chatRoom').add(
    //   {
    //     'chatRoomTitle': _addTitle,
    //     'time': Timestamp.now(),
    //   },
    // );

    final depart =
        FirebaseFirestore.instance.collection('chatRoom').doc(_addTitle);
    final UserInfo =
        FirebaseFirestore.instance.collection('admin').doc(user.uid);

    //채팅방 만드는 코드임.
    // depart.set({
    //   'chatRoomTitle': _addTitle,
    //   'time': Timestamp.now(),
    // });

    depart.get().then((value) {
      print(value.get('chatRoomTitle'));
    });

    UserInfo.get().then((value) {
      String userName = value.get('userName');
      // String userIdentity = value.get('userIdentity');
      String userDepartment = value.get('userDepartment');
      if (userDepartment != _department) {
        print('본인 학과가 아닙니다.');
      } else {
        depart.set({
          'chatRoomTitle': _addTitle,
          'time': Timestamp.now(),
          'Department': _department
        });
        print('학과 채팅방이 생성되었습니다.');
      }
    });
    Navigator.pop(context);
    _snackBarMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    _semester.trim().trim().isEmpty &&
                            _department.trim().isEmpty &&
                            _grade.trim().isEmpty
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
                        'New ChatRoom',
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
                        if (_semester.trim().isNotEmpty &&
                            _department.trim().isNotEmpty &&
                            _grade.trim().isNotEmpty) {
                          return _createChatRoom();
                        } else
                          return _checkMessage();
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
                              'Add',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: DropdownButton(
                      hint: Text('Semester'),
                      items: _semesterList
                          .map((String item) => DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              ))
                          .toList(),
                      onChanged: (var value) {
                        setState(() {
                          _selectedSemseter = value;
                          _semester = _selectedSemseter;
                        });
                      },
                      value: _selectedSemseter,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: DropdownButton(
                      hint: Text('Department'),
                      items: _departmentList
                          .map((String item) => DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              ))
                          .toList(),
                      onChanged: (var value) {
                        setState(() {
                          _selectedDepartment = value;
                          _department = _selectedDepartment;
                        });
                      },
                      value: _selectedDepartment,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: DropdownButton(
                      hint: Text('Grade'),
                      items: _gradeList
                          .map((String item) => DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              ))
                          .toList(),
                      onChanged: (var value) {
                        setState(() {
                          _selectedGrade = value;
                          _grade = _selectedGrade;
                        });
                      },
                      value: _selectedGrade,
                    ),
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
