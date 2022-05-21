import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/model/addNotice.dart';
import 'package:ui_1/model/notice.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/model/noticeModel.dart';
import 'package:ui_1/widget/noticeList.dart';

class NoticePage extends StatefulWidget {
  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  TextEditingController _textEditingController = TextEditingController();
  // List<Notice> _notices = [];

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: AddNotice(),
        );
      },
    );
  }
  
  List<NoticeModels> noticeModels =[
     NoticeModels(
        name: "이도흠",
        noticeTitle: '이거는 제목임',
        noticeText: '길이 아니라 이 정도 길이는 어떻게 되는지 정말 궁금한데 이거 그대로 상자 크기만 커지만 ㄹㅇ 너무 대박인데 Expaned라서 옆으로만 커지는 거 아닌가 모르겠넹',
        imageURL: 'images/home.png',
        time: '오후 5:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                        'Notice',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          // showAlert(context);
                          // return AddNotice();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNotice()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorSet.appBarColor,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Add New',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                  ),
                ),
              ),

              ListView.builder(
                itemCount: noticeModels.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top : 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NoticeList(
                    name: noticeModels[index].name,
                    noticeTitle: noticeModels[index].noticeTitle,
                    noticeText: noticeModels[index].noticeText,
                    imageURL: noticeModels[index].imageURL,
                    time: noticeModels[index].time,
                    isNoticeRoad: (index == 0 || index == 3)?true:false,
                    );
                },
                ),

              // ListView.builder(
              //       reverse: true,
              //       itemBuilder: (context, index) {
              //         // return ChatBubble(_chats[index]);
              //         return _notices[index];
              //       },
              //       itemCount: _notices.length,
              //     ),
            ],
          ),
        ),
      ),
    );
  }

  // void _handleSubmitted(String text) {
  //   _textEditingController.clear();
  //   Notice newNotice = Notice(text);
  //   setState(() {
  //     _notices.insert(0, newNotice);
  //   });
  // }

}
