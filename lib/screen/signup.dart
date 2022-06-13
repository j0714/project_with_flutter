import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';
  String? userDepartment = '';
  String userId = ''; //학번
  String userSemester = '';
  String userDoubleMajor = '';
  String userMinor = '';
  String userIdentity = '';

  String? _selectedValue = '';

  final _valueList = [
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

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            width: 150,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '회원가입 성공',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  //onTap: _tryValidation,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 60.0, left: 30.0, right: 30.0, bottom: 0.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        '로그인하러 가기',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginForm()));
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('회원가입'),
            centerTitle: true,
            toolbarHeight: 60.h,
            backgroundColor: Color(0xff5D8AB7),
          ),
          body: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.black45,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "재학생/신입생",
                  ),
                  Tab(
                    text: "관리자",
                  ),
                ],
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: TabBarView(
                    children: [
                      Container(
                        color: Color(0xffDAE0E8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Center(
                            child: Theme(
                              data: ThemeData(
                                inputDecorationTheme: InputDecorationTheme(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 40.h),
                                    child: TextFormField(
                                      key: ValueKey(1),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "이름을 입력하세요";
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        userName = value!;
                                      },
                                      onChanged: (value) {
                                        userName = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '* 이름',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:  45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(2),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.contains('@gnu.ac.kr')) {
                                          return "학교 이메일을 입력하세요";
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        userEmail = value!;
                                      },
                                      onChanged: (value) {
                                        userEmail = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: '* 학교 이메일',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top:10.h),
                                    child: TextFormField(
                                      key: ValueKey(3),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 6) {
                                          return "비밀번호는 6글자 이상";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userPassword = value!;
                                      },
                                      onChanged: (value) {
                                        userPassword = value;
                                      },
                                      obscureText: true, //치고나면 안보이게 설정
                                      decoration: InputDecoration(
                                        hintText: '* 비밀번호',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 10.h, left: 20.0, right: 20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                    child: DropdownButton(
                                      hint: Text('   * 학과를 선택하세요'),
                                      dropdownColor: Colors.white,
                                      items: [
                                        DropdownMenuItem(child:Text('생명과학부'), value:'생명과학부'),
                                        DropdownMenuItem(child:Text('물리학과'), value:'물리학과'),
                                        DropdownMenuItem(child:Text('수학과'), value:'수학과'),
                                        DropdownMenuItem(child:Text('식품영양학과'), value:'식품영양학과'),
                                        DropdownMenuItem(child:Text('의류학과'), value:'의류학과'),
                                        DropdownMenuItem(child:Text('정보통계학과'), value:'정보통계학과'),
                                        DropdownMenuItem(child:Text('지질과학과'), value:'지질과학과'),
                                        DropdownMenuItem(child:Text('컴퓨터과학과'), value:'컴퓨터과학과'),
                                        DropdownMenuItem(child:Text('화학과'), value:'화학과'),
                                        DropdownMenuItem(child:Text('제약공학과'), value:'제약공학과'),
                                        DropdownMenuItem(child:Text('항노화신소재과학과'), value:'항노화신소재과학과'),
                                      ],


                                      // items: _valueList.map(
                                      //   (String item) => DropdownMenuItem(child: Text(item), value: item,)
                                      // ).toList(),
                                      // onChanged: (String? value){
                                      //   setState(() {
                                      //     _selectedValue = value;
                                      //     userDepartment = _selectedValue;
                                      //   });
                                      // },
                                      // value: _selectedValue,


                                      onChanged: (String? value) {
                                        // userDepartment
                                        _selectedValue = value;
                                        userDepartment = _selectedValue;
                                      },
                                      value: _selectedValue,
                                    ),
                                  ),
                                  // Container(
                                  //   height: m.size.height * 0.06102,
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 20.0), //가로여백설정
                                  //   margin: EdgeInsets.only(top: m.size.height * 0.01356),
                                  //   child: TextFormField(
                                  //     key: ValueKey(4),
                                  //     onSaved: (value) {
                                  //       userDepartment = value!;
                                  //     },
                                  //     onChanged: (value) {
                                  //       userDepartment = value;
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       hintText: '학과',
                                  //       fillColor: Colors.grey[50],
                                  //       filled: true,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(5),
                                      onSaved: (value) {
                                        userId = value!;
                                      },
                                      onChanged: (value) {
                                        userId = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '* 학번',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(6),
                                      onSaved: (value) {
                                        userSemester = value!;
                                      },
                                      onChanged: (value) {
                                        userSemester = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: ' * 이수학기',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(7),
                                      onSaved: (value) {
                                        userDoubleMajor = value!;
                                      },
                                      onChanged: (value) {
                                        userDoubleMajor = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '복수전공',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top:10.h),
                                    child: TextFormField(
                                      key: ValueKey(8),
                                      onSaved: (value) {
                                        userMinor = value!;
                                      },
                                      onChanged: (value) {
                                        userMinor = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '부전공',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 50.h, left: 30.0, right: 30.0, bottom: 0.0
                                    ),
                                    width: double.infinity,
                                    child: TextButton(
                                      child: Text(
                                        '회원가입',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => LoginForm()));
                                        _tryValidation();
                                        try {
                                          final newUser = await _authentication
                                              .createUserWithEmailAndPassword(
                                                  email: userEmail,
                                                  password: userPassword);

                                          await FirebaseFirestore.instance
                                              .collection('student')
                                              .doc(newUser.user!.uid)
                                              .set({
                                            'userName': userName,
                                            'userID': userId,
                                            'userEmail': userEmail,
                                            'userDepartment': userDepartment,
                                            'userSemester': userSemester,
                                            'userDoubleMajor': userDoubleMajor,
                                            'userMinor': userMinor,
                                            'userIdentity': userIdentity
                                          });

                                          if (newUser.user != null) {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) {
                                            //       return LoginForm();
                                            //     },
                                            //   ),
                                            // );
                                            await newUser.user
                                                ?.sendEmailVerification();
                                            showAlert(context);
                                          }
                                        } catch (e) {
                                          print(e);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "check your email or password"),
                                            backgroundColor: Colors.blue,
                                            duration: Duration(seconds: 1),
                                          ));
                                        }
                                        ;
                                        //showAlert(context);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ), // SizedBox(height: 00.0,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xffDAE0E8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Center(
                            child: Theme(
                              data: ThemeData(
                                inputDecorationTheme: InputDecorationTheme(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height:45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 40.h),
                                    child: TextFormField(
                                      key: ValueKey(11),
                                      onSaved: (value) {
                                        userName = value!;
                                      },
                                      onChanged: (value) {
                                        userName = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '* 이름',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(12),
                                      onSaved: (value) {
                                        userEmail = value!;
                                      },
                                      onChanged: (value) {
                                        userEmail = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: '* 이메일',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(13),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 6) {
                                          return "비밀번호는 6자리 이상";
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        userPassword = value!;
                                      },
                                      onChanged: (value) {
                                        userPassword = value;
                                      },
                                      obscureText: true, //치고나면 안보이게 설정
                                      decoration: InputDecoration(
                                        hintText: '* 비번',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 10.h, left: 20.0, right: 20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                    child: DropdownButton(
                                      hint: Text('   * 학과를 선택하세요'),
                                      dropdownColor: Colors.white,
                                      items: [
                                        DropdownMenuItem(child:Text('생명과학부'), value:'생명과학부'),
                                        DropdownMenuItem(child:Text('물리학과'), value:'물리학과'),
                                        DropdownMenuItem(child:Text('수학과'), value:'수학과'),
                                        DropdownMenuItem(child:Text('식품영양학과'), value:'식품영양학과'),
                                        DropdownMenuItem(child:Text('의류학과'), value:'의류학과'),
                                        DropdownMenuItem(child:Text('정보통계학과'), value:'정보통계학과'),
                                        DropdownMenuItem(child:Text('지질과학과'), value:'지질과학과'),
                                        DropdownMenuItem(child:Text('컴퓨터과학과'), value:'컴퓨터과학과'),
                                        DropdownMenuItem(child:Text('화학과'), value:'화학과'),
                                        DropdownMenuItem(child:Text('제약공학과'), value:'제약공학과'),
                                        DropdownMenuItem(child:Text('항노화신소재과학과'), value:'항노화신소재과학과'),
                                      ],
                                      onChanged: (value) {
                                      },
                                    ),
                                  ),
                                  // Container(
                                  //   height: m.size.height * 0.06102,
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 20.0), //가로여백설정
                                  //   margin: EdgeInsets.only(top:m.size.height * 0.01356),
                                  //   child: TextFormField(
                                  //     key: ValueKey(14),
                                  //     onSaved: (value) {
                                  //       userDepartment = value!;
                                  //     },
                                  //     onChanged: (value) {
                                  //       userDepartment = value;
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       hintText: '학과',
                                  //       fillColor: Colors.grey[50],
                                  //       filled: true,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    height: 45.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0), //가로여백설정
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: TextFormField(
                                      key: ValueKey(15),
                                      onSaved: (value) {
                                        userIdentity = value!;
                                      },
                                      onChanged: (value) {
                                        userIdentity = value;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '* 신원',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 60.h,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 0.0),
                                    width: double.infinity,
                                    child: TextButton(
                                      child: Text(
                                        '회원가입',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => LoginForm()));
                                        _tryValidation();
                                        try {
                                          final newUser = await _authentication
                                              .createUserWithEmailAndPassword(
                                                  email: userEmail,
                                                  password: userPassword);

                                          await FirebaseFirestore.instance
                                              .collection('admin')
                                              .doc(newUser.user!.uid)
                                              .set({
                                            'userName': userName,
                                            'userID': userId,
                                            'userEmail': userEmail,
                                            'userDepartment': userDepartment,
                                            'userSemester': userSemester,
                                            'userDoubleMajor': userDoubleMajor,
                                            'userMinor': userMinor,
                                            'userIdentity': userIdentity
                                          });

                                          if (newUser.user != null) {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) {
                                            //       return LoginForm();
                                            //     },
                                            //   ),
                                            // );
                                            await newUser.user
                                                ?.sendEmailVerification();
                                            showAlert(context);
                                          }
                                        } catch (e) {
                                          print(e);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "check your email or password"),
                                            backgroundColor: Colors.blue,
                                            duration: Duration(seconds: 1),
                                          ));
                                        }
                                        ;
                                        //showAlert(context);
                                      },
                                      // {
                                      //   // Navigator.push(
                                      //   //     context,
                                      //   //     MaterialPageRoute(
                                      //   //         builder: (_) => LoginForm()));
                                      //   _tryValidation();
                                      //   showAlert(context);
                                      // },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),

                                  // SizedBox(height: 00.0,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
