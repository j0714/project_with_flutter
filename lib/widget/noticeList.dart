import 'package:ui_1/screen/chatDetailPage.dart';
import 'package:flutter/material.dart';

class NoticeList extends StatefulWidget {
  String name;
  String noticeTitle;
  String noticeText;
  String imageURL;
  String time;
  bool isNoticeRoad;
  NoticeList(
      {required this.name,
      required this.noticeTitle,
      required this.noticeText,
      required this.imageURL,
      required this.time,
      required this.isNoticeRoad});
  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return ChatDetailPage();
        //       },
        //     ),
        //   );
        // },
        child: Container(
      // color: Colors.amber,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            // color: Colors.amber,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageURL),
                        maxRadius: 20,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              // Text(
                              //   widget.noticeText,
                              //   style: TextStyle(
                              //     fontSize: 13,
                              //     color: Colors.grey.shade600,
                              //     fontWeight: widget.isNoticeRoad
                              //         ? FontWeight.bold
                              //         : FontWeight.normal,
                              //   ),
                              // ),
                              Text(
                                widget.time,
                                style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: widget.isNoticeRoad
                                    //     ? FontWeight.bold
                                    //     : FontWeight.normal,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Text(
                //   widget.time,
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: widget.isNoticeRoad
                //           ? FontWeight.bold
                //           : FontWeight.normal),
                // ),
                Icon(Icons.delete),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: <Widget>[
                // SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    widget.noticeTitle,
                    style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.bold,),),)
              ],),
          ),
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.noticeText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                      // color: Colors.grey.shade600,
                      // fontWeight: widget.isNoticeRoad
                      //     ? FontWeight.bold
                      //     : FontWeight.normal,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
