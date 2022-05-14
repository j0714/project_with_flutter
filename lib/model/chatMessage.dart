import 'dart:io';

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;
  // final bool isMe;
  // const ChatMessage(this.txt, this.isMe, {Key? key}) : super(key: key);
  const ChatMessage(this.txt, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Row(
        // mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text('N'),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID or name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: isMe ? Colors.blue : Colors.amber,
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(12),
                    ),
                  width: 145,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 4),
                child : Text(
                  txt,
                  // style: TextStyle(
                  //   color: isMe ? Colors.black : Colors.white
                  // ),
                  ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
