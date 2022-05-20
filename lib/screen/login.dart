import 'package:flutter/material.dart';
import 'package:ui_1/screen/privacy_detail.dart';
import 'package:ui_1/screen/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  void login_text(){
    ThemeData(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('개척Talk', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        toolbarHeight: 60.0,
        backgroundColor: Color(0xff5D8AB7),
      ),
       body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Color(0xffDAE0E8),
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200.0,),
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
                      margin: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: <Widget>[
                          TextField(decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'User Email',
                            fillColor: Colors.grey[50],
                            filled: true,
                          ),),
                          SizedBox(height: 10.0,),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                              fillColor: Colors.grey[50],
                              filled: true,
                            ),),
                        ],
                      )
                  ),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 60.0, left:10.0, right: 10.0, bottom: 5.0),
                    width: double.infinity,
                    child:
                    TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        // Navigator.push(context,
                        //   MaterialPageRoute(builder: (_)=> HomePage()));
                        },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, left:10.0, right: 10.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Signup',
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
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                      '비밀번호를 잊으셨나요?',
                      style: TextStyle(color: Colors.blue[700]), textAlign: TextAlign.center,
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_)=> Privacy_detail()));
                      },
                    ),
                  ),
                  SizedBox(height: 135.0,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
