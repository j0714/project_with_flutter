import 'package:flutter/material.dart';
import 'package:ui_1/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';
  String userDepartment = '';
  String userId = ''; //학번
  String userSemester = '';
  String userDoubleMajor = '';
  String userMinor = '';
  String userIdentity = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
          centerTitle: true,
          toolbarHeight: 60.0,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 40.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "이름을 입력하세요";
                                    } else
                                      return null;
                                  },
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  key: ValueKey(1),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blueGrey),
                                    ),
                                    hintText: '이름',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "writhe email";
                                    } else
                                      return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  key: ValueKey(2),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '이메일',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  key: ValueKey(3),
                                  obscureText: true, //치고나면 안보이게 설정
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '비번',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userDepartment = value!;
                                  },
                                  key: ValueKey(4),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '학과',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userId = value!;
                                  },
                                  key: ValueKey(5),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '학번',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userSemester = value!;
                                  },
                                  key: ValueKey(6),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '이수학기',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userDoubleMajor = value!;
                                  },
                                  key: ValueKey(7),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '복수전공',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userMinor = value!;
                                  },
                                  key: ValueKey(8),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '부전공',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _tryValidation,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 60.0,
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 0.0),
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Text(
                                      '회원가입',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => LoginForm()));
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ), // SizedBox(height: 00.0,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xffDAE0E8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 40.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  key: ValueKey(11),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blueGrey),
                                    ),
                                    hintText: '이름',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  key: ValueKey(12),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '이메일',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  key: ValueKey(13),
                                  obscureText: true, //치고나면 안보이게 설정
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '비번',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userDepartment = value!;
                                  },
                                  key: ValueKey(14),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '학과',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0), //가로여백설정
                                margin: EdgeInsets.only(top: 10.0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    userIdentity = value!;
                                  },
                                  key: ValueKey(15),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), ////외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0)), //외곽이 얼마나 둥글어 질껀지
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    hintText: '신원',
                                    fillColor: Colors.grey[50],
                                    filled: true,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _tryValidation,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 60.0,
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 0.0),
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Text(
                                      '회원가입',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => LoginForm()));
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 00.0,),
                            ],
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
    );
  }
}
