import 'package:ui_1/screen/notice_setting.dart';
import 'package:ui_1/screen/notification.dart';
import 'package:ui_1/screen/privacy.dart';
import 'package:flutter/material.dart';

class SettingList extends StatefulWidget {
  String name;
  IconData? iconset;
  SettingList({
    required this.name,
    required this.iconset,
  });
  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              //제목에 맞춰서 페이지 이름 대칭
              if (widget.name == 'Privacy') {
                return Privacy();
              } else if (widget.name == 'Notice Setting') {
                return Notice_Setting();
              } else {
                return notification();
              }
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey.shade100,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    widget.iconset,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
