import 'package:flutter/material.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New Notice',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'notice title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'write notice',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 20,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // color: ColorSet.appBarColor,
                          color: Colors.amber),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Add New',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   // crossAxisAlignment: CrossAxisAlignment.end,
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     IconButton(onPressed: () {}, icon: Icon(Icons.bento_sharp))
                    //   ],
                    // )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
