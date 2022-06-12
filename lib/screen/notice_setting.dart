import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Notice_Setting extends StatefulWidget {
  const Notice_Setting({Key? key}) : super(key: key);
  @override
  State<Notice_Setting> createState() => _Notice_SettingState();
}

class _Notice_SettingState extends State<Notice_Setting> {

  final Controller controller = Get.put(Controller());

  Color color1 = Colors.blue;
  Color color2 = Colors.red;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Notice Setting', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 60.h,
        backgroundColor: Color(0xff5D8AB7),
      ),
      body: Container(
        color: Color(0xffDAE0E8),
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:10.0, right: 10.0),
                      child: Text("제 1전공", style: TextStyle(fontSize: 30.0)),
                    ),
                    GetX<Controller>(builder:(_)=>Container(
                      // backgroundImage: NetworkImage(widget.imageURL),
                      color: controller.noticecolor().color1,
                      margin: EdgeInsets.only(right: 10.0),
                      height: 40.h, width: 40.0,
                    ),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24)),
                        onPressed: () => pickColor_1(context, ),
                        child: Text(
                          'Pick Color',
                          style: TextStyle(fontSize: 20),
                        )
                    )
                  ]
              ),
              SizedBox(height:50.h,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left:10.0, right: 10.0),
                    child: Text("제 2전공", style: TextStyle(fontSize: 30.0)),
                  ),
                  GetX<Controller>(builder:(_)=>Container(
                    // backgroundImage: NetworkImage(widget.imageURL),
                    color: controller.noticecolor().color2,
                    margin: EdgeInsets.only(right: 10.0),
                    height: 40.h, width: 40.0,
                  ),),
                  // Container(
                  //   margin: EdgeInsets.only(right: 10.0),
                  //   height: m.size.height * 0.05424, width: 40.0,
                  //   color: this.color2,
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24)),
                      onPressed: () => pickColor_2(context),
                      child: Text(
                        'Pick Color',
                        style: TextStyle(fontSize: 20),
                      ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:50.h, left:10.0, right: 10.0),
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    '설정 초기화',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    controller.updatecolor(Colors.blue, Colors.red);
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker_1() => BlockPicker(
    pickerColor: color1,
    availableColors: [
      Colors.red,
      Colors.pink,
      Colors.redAccent,
      Colors.orange,
      Colors.amberAccent,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
      Colors.tealAccent,
      Colors.cyan,
      Colors.lightBlueAccent,
      Colors.blueAccent,
      Colors.indigoAccent,
      Colors.indigo,
      Colors.deepPurpleAccent,
      Colors.deepPurple,
      Colors.blueGrey,
      Colors.grey,
      Colors.brown,
      Colors.black,
    ],
    onColorChanged: (color) => setState(() => this.color1 = color),
  );

  Widget buildColorPicker_2() => BlockPicker(
    pickerColor: color2,
    availableColors: [
      Colors.red,
      Colors.pink,
      Colors.redAccent,
      Colors.orange,
      Colors.amberAccent,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
      Colors.tealAccent,
      Colors.cyan,
      Colors.lightBlueAccent,
      Colors.blueAccent,
      Colors.indigoAccent,
      Colors.indigo,
      Colors.deepPurpleAccent,
      Colors.deepPurple,
      Colors.blueGrey,
      Colors.grey,
      Colors.brown,
      Colors.black,
    ],
    onColorChanged: (color) => setState(() => this.color2 = color),
  );

  void pickColor_1(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Pick Your Color'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildColorPicker_1(),
          TextButton(
            child: Text(
              'SELECT',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: (){
              controller.updatecolor(this.color1, this.color2);
              Navigator.of(context).pop();
            }
            // => Navigator.of(context).pop(),
          ),
        ],
      ),
    ),
  );

  void pickColor_2(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Pick Your Color'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildColorPicker_2(),
          TextButton(
            child: Text(
              'SELECT',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              controller.updatecolor(this.color1, this.color2);
              Navigator.of(context).pop();
            }
          ),
        ],
      ),
    ),
  );
}
