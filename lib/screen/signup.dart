import 'package:ui_1/screen/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


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
                Tab(text: "재학생/신입생",),
                Tab(text: "관리자",),
              ],
            ),
            Expanded(child: TabBarView(children: [
              Container(
                color: Color(0xffDAE0E8),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.0,),
                        Form(child: Theme(data:ThemeData(
                          inputDecorationTheme: InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                          child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '이름',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '이메일',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: '비번',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                      ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '학과',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '학번',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '이수학기',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '복수전공',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '부전공',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                ],
                              )
                          ),
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: 60.0, left:10.0, right: 10.0, bottom: 0.0),
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                              '회원가입',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_)=> LoginForm()));
                            },
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ), // SizedBox(height: 00.0,),
                      ],),
                  ),
                ),
              ),
              Container(
                color: Color(0xffDAE0E8),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.0,),
                        Form(child: Theme(data:ThemeData(
                          inputDecorationTheme: InputDecorationTheme(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                          child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '이름',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '이메일',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: '비번',
                                        fillColor: Colors.grey[50],
                                        filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '학과',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                  SizedBox(height: 10.0,),
                                  Container(height: 45.0,
                                    child: TextField(decoration: InputDecoration(
                                      hintText: '신원',
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                    ),),),
                                ],
                              )
                          ),
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: 60.0, left:10.0, right: 10.0, bottom: 0.0),
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                              '회원가입',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_)=> LoginForm()));
                            },
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ), // SizedBox(height: 00.0,),
                      ],),
                  ),
                ),
              ),
            ],),
            ),
          ],
        ),
      ),
    );
  }
}
