import 'package:ui_1/color/shareColor.dart';
import 'package:ui_1/model/chatMessage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _chats = [];

  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Testing', //여기는 이제 단체 채팅방 이름을 넣으면 됨
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) {
                    return _chats[index];
                    //     return Container(
                    //   padding: EdgeInsets.only(
                    //     left: 14,
                    //     right: 14,
                    //     top: 10,
                    //     bottom: 10,
                    //   ),
                    //   child: Align(
                    //     alignment: (message[index].messageType == 'receiver'
                    //         ? Alignment.topLeft
                    //         : Alignment.topRight),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20),
                    //         color: (message[index].messageType == 'receiver'
                    //             ? Colors.grey.shade200
                    //             : Colors.blue[200]),
                    //       ),
                    //       padding: EdgeInsets.all(16),
                    //       child: Text(
                    //         message[index].messageContent,
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  itemCount: _chats.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60, //이거 때문에 안되는거 같은데 개짜증나네....
                  width: double.infinity,
                  color: Colors.white,
                  // color: Colors.amber, //이거 나중에 바꾸기
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // 세부사항 구현에 활용 +모양으로 각종 파일 넘겨 받을 수 있으면...
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          // maxLines: null, // 난 이거 왜 안되냐....
                          // maxLines: 5,
                          // minLines: 1,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Write message...',
                            hintStyle: TextStyle(color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onSubmitted: _handleSubmitted,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _handleSubmitted(_textEditingController.text);
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage newChat = ChatMessage(text);
    setState(() {
      _chats.insert(0, newChat);
    });
  }
}
