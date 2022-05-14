import 'package:chatapp/screen/noticeSettingDetailPage.dart';
import 'package:chatapp/screen/notificationDetailPage.dart';
import 'package:chatapp/screen/privacyDetailPage.dart';
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
            builder: (context) { //제목에 맞춰서 페이지 이름 대칭
              if (widget.name == 'Privacy') {
                return PrivacyPage();
              } else if (widget.name == 'Notice Setting') {
                return NoticeSettingPage();
              } else {
                return NotificationsPage();
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
