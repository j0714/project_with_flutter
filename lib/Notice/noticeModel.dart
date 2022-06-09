import 'package:flutter/material.dart';

class NoticeModel extends StatelessWidget {
  const NoticeModel(
      this.noticeTitle, this.noticeText, this.userName, this.noticeTime,
      {Key? key})
      : super(key: key);

  final String noticeTitle;
  final String noticeText;
  final String userName;
  final String noticeTime;

  @override
  Widget build(BuildContext context) {
    void _showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Edit'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {},
              ),
            ],
          ));
        },
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70, // 이게 배경색입니다.
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        // backgroundImage: NetworkImage(widget.imageURL),
                        backgroundColor: Colors.blue,
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
                                userName,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                // '시간',
                                noticeTime,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _showBottomSheet,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noticeTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    noticeText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
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
