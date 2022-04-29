
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xff5D8AB7),
      ),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: Color(0xffDAE0E8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.0,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.person),
                            hintText: '이름',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.lock),
                            hintText: '학과',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.person),
                            hintText: '학번',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.person),
                            hintText: '이수학기',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.person),
                            hintText: '복수전공',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),    //가로여백설정
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
                            prefixIcon: Icon(Icons.person),
                            hintText: '부전공',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100.0, left:30.0, right: 30.0, bottom: 30.0),
                        width: double.infinity,
                        child: FlatButton(
                          child: Text(
                            '회원가입',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_)=> SignupForm()));
                          },

                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(height: 250.0,),
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text('Does not have account?'),
                      //       FlatButton(
                      //         textColor: Colors.blue,
                      //           child: Text('Sign up'),
                      //         onPressed: (){
                      //           Navigator.push(context,
                      //               MaterialPageRoute(builder: (_)=> SignupForm()));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )

          ),
        // child: Center(
        //   child: Text('재학생/신입생'),
        // ),
    );
  }
}
