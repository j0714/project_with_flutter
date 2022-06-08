import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {


  @override
  State<notification> createState() => _notificationState();
}


class _notificationState extends State<notification> {

  var switchW1 = false;
  var switchW2 = false;
  var switchM1 = false;
  var switchM2 = false;
  var switchN1 = false;
  var switchN2 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // 화살표 버튼 삭제
          title: Text(
            '개척Talk',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), //AppBar 색상 변경
          ),
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 400.0,
                          margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                          child: Text('전체 알림'),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('메시지 알림', style: TextStyle(fontSize: 18.0),),
                            ),
                            Switch(
                                value: switchW1 ,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchW1  = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('소리', style: TextStyle(fontSize: 18.0),),
                            ),
                            Switch(
                                value: switchW2 ,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchW2 = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        Container(
                          width: 400.0,
                          margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                          child: Text('새 메시지 알림'),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('메시지 알림', style: TextStyle(fontSize: 18.0),),
                            ),
                            Switch(
                                value: switchM1 ,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchM1 = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('소리', style: TextStyle(fontSize: 18.0),),
                            ),
                            Switch(
                                value: switchM2,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchM2 = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        Container(
                          width: 400.0,
                          margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                          child: Text('공지 알림'),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('메시지 알림', style: TextStyle(fontSize: 18.0 )),
                            ),
                            Switch(
                                value: switchN1,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchN1 = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        Row(
                          children: [
                            Container(
                              width: 290.0,
                              child: Text('소리', style: TextStyle(fontSize: 18.0),),
                            ),
                            Switch(
                                value: switchN2,
                                onChanged: (value) {
                                  setState(() {print(value);
                                  switchN2 = value;
                                  });
                                })],
                        ),
                        const Divider(color: Colors.white, thickness: 1.0),
                        SizedBox(height: 30.0,),
                      ],

                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
