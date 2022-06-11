import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorSet{
  static const pageBackgroundColor = Color(0xffDAE0E8);
  static const appBarColor = Color(0xff5D8AB7);
}

class noticeColor{
  noticeColor({this.color1 = Colors.blue, this.color2 = Colors.red});

  Color color1;
  Color color2;

}

class Controller extends GetxController{
  var noticecolor = noticeColor().obs;

  void updatecolor(ncolor1, ncolor2){
    noticecolor.update((val) {
      val?.color1 = ncolor1;
      val?.color2 = ncolor2;
    });
  }
}