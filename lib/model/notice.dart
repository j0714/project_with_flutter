import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  final String txt;
  const Notice(this.txt, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Row(
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
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(12),
                    ),
                  // width: 145,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 4),
                child : Text(
                  txt,
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