
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 40.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blueGrey),
                              ),
                              hintText: '이름',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            obscureText: true,     //치고나면 안보이게 설정
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),   ////외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),  //외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '비번',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),   ////외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),  //외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '학과',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '학번',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '이수학기',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '복수전공',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '부전공',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                          Container(

                          margin: EdgeInsets.only(top: 60.0, left:30.0, right: 30.0, bottom: 0.0),
                          width: double.infinity,
                          child: FlatButton(
                            child: Text(
                              '회원가입',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_)=> Signup()));
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
                Container(
                  color: Color(0xffDAE0E8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '이름',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),    //가로여백설정
                          margin: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            obscureText: true,     //치고나면 안보이게 설정
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),   ////외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),  //외곽이 얼마나 둥글어 질껀지
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '학과',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),
                          ),
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 60.0, left:30.0, right: 30.0, bottom: 0.0),
                          width: double.infinity,
                          child: FlatButton(
                            child: Text(
                              '회원가입',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_)=> Signup()));
                            },
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
              ],),
              ),
            ],
          ),
        ),
    );
  }
}
