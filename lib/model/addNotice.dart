import 'package:flutter/material.dart';
import 'package:ui_1/color/shareColor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  final _authentication = FirebaseAuth.instance;
  // final _formKey = GlobalKey<FormState>();
  String addTitle = '';
  String addText = '';

  // void _tryValidation(){
  //   final isValid = _formKey.currentState!.validate();
  //   if(isValid){
  //     _formKey.currentState!.save();
  //   }
  // }

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
          backgroundColor: ColorSet.appBarColor,
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
                      color: Colors.white,
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
                            color: Colors.white,
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
        body: Scaffold(
          backgroundColor: ColorSet.pageBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey(1),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write notice!';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      addTitle = value!;
                    },
                    onChanged: (value) {
                      addTitle = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Notice title',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey(2),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write notice!';
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      addText = value!;
                    },
                    onChanged: (value) {
                      addText = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Write notice',
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
                  SizedBox(height: 20),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _tryValidation();
                          print(addTitle);
                          print(addText);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorSet.appBarColor),
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
                                'Add Notice',
                                style: TextStyle(
                                  color: Colors.white,
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
        ),
      ),
    );
  }
}
