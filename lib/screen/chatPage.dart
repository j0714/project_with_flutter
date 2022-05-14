import 'package:chatapp/color/shareColor.dart';
import 'package:chatapp/model/chatUsersModel.dart';
import 'package:chatapp/widget/conversationList.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  void showAlert(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            width: 150,
            height: 300,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueGrey,
                )
              ],
            ),
          ),
        );
      });
  }

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "김윤아",
        messageText: '길',
        imageURL: 'images/home.png',
        time: '오후 5:00'),
    ChatUsers(
        name: "더 크로스",
        messageText: '떠나가요 떠나가지마요',
        imageURL: 'images/home.png',
        time: '오후 4:45'),
    ChatUsers(
        name: "노리조",
        messageText: '형',
        imageURL: 'images/home.png',
        time: '오전 11:40'),
    ChatUsers(
        name: "YB",
        messageText: '앚을께',
        imageURL: 'images/home.png',
        time: '오전 10:20'),
    ChatUsers(
        name: "장범준",
        messageText: '잠이 오질 않네요',
        imageURL: 'images/home.png',
        time: '오전 9:13'),
    ChatUsers(
        name: "버즈",
        messageText: '은인',
        imageURL: 'images/home.png',
        time: '오전 8:22'),
    ChatUsers(
        name: "체리필터",
        messageText: '오리 날다',
        imageURL: 'images/home.png',
        time: '어제'),
    ChatUsers(
        name: "블랙핑크",
        messageText: '뚜두뚜두',
        imageURL: 'images/home.png',
        time: '어제'),
    ChatUsers(
        name: "손디아",
        messageText: '어른',
        imageURL: 'images/home.png',
        time: '어제'),
    ChatUsers(
        name: "김기태",
        messageText: '반쪽짜리',
        imageURL: 'images/home.png',
        time: '어제'),
    ChatUsers(
        name: "BTS",
        messageText: 'DNA',
        imageURL: 'images/home.png',
        time: '어제'),
  ]; // 채팅방
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
                      'Conversation',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        showAlert(context);
                      },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
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
                    ),)
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
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageURL: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRoad: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
