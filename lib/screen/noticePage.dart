import 'package:chatapp/color/shareColor.dart';
import 'package:chatapp/model/addNotice.dart';
import 'package:chatapp/model/notice.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {

  TextEditingController _textEditingController = TextEditingController();
  List<Notice> _notices = [];

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: AddNotice(),
          );
        });
  }

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
                      'Notice',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showAlert(context);
                        // return AddNotice();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNotice()));
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
            // ListView.builder(
            //   itemCount: chatUsers.length,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.only(top : 16),
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ConversationList(
            //       name: chatUsers[index].name,
            //       messageText: chatUsers[index].messageText,
            //       imageURL: chatUsers[index].imageURL,
            //       time: chatUsers[index].time,
            //       isMessageRoad: (index == 0 || index == 3)?true:false,
            //       );
            //   },
            //   ),

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
