import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/widget/settingList.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SettingList> settingLists = [
    SettingList(
      name: 'Privacy',
      iconset: Icons.lock_outline,
    ),
    SettingList(
      name: 'Notice Setting',
      iconset: Icons.event,
    ),
    SettingList(
      name: 'Notifications',
      iconset: Icons.notifications_none,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSet.pageBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Setting',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: settingLists.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SettingList(
                  name: settingLists[index].name,
                  iconset: settingLists[index].iconset,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
