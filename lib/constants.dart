import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kScreenBackgroundColor = Color(0xff1C162E);
const kButtonColor1 = Color(0xff1AD5AD);
const kButtonColor2 = Color(0xff9D70FF);

// const kButtonTextStyle = TextStyle(
//   color: Colors.lightBlueAccent,
//   fontWeight: FontWeight.bold,
//   fontSize: 18.0,
// );

// const kTextFieldDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   hintText: 'Type your message here...',
//   border: InputBorder.none,
// );

// const kContainerDecoration = BoxDecoration(
//   border: Border(
//     top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//   ),
// );

const kTextFieldDecoration = InputDecoration(
  //prefixIcon: Icon(Icons.email),
  //fillColor: Color(0xff140F26),
  hintText: 'Enter your value',
  hintStyle: TextStyle(
    fontSize: 14.0,
    color: Color(0x4DFFFFFF),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
);
