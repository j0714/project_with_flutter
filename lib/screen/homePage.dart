import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/screen/chatPage.dart';
import 'package:ui_1/screen/noticePage.dart';
import 'package:ui_1/screen/settingPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              Center(
                child: ChatPage(),
              ),
              Center(
                child: NoticePage(),
              ),
              Center(
                child: SettingPage(),
              )
            ],
          ),
          extendBodyBehindAppBar: true,
          bottomNavigationBar: Container(
            color: ColorSet.appBarColor,
            child: SafeArea(
              child: Container(
                height: 70,
                padding: EdgeInsets.only(bottom: 10, top: 5),
                child: TabBar(
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor:
                      ColorSet.appBarColor, // 라벨 없애는 방법을 몰라서 배경색이랑 같은 걸로 설정
                  // indicatorWeight: 2,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black38,
                  labelStyle: TextStyle(
                    fontSize: 13,
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.wechat),
                      text: "Chat",
                    ),
                    Tab(
                      // icon: Icon(Icons.notifications),
                      icon: Icon(Icons.event),
                      text: "Notice",
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                      text: "Setting",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
