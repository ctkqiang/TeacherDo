import 'package:flutter/material.dart';
import 'package:teacherdo/constant/const.dart';

Widget appBar(BuildContext context) {
  void onSearch() {}

  return AppBar(
    actions: <Widget>[
      IconButton(
        tooltip: "Search",
        icon: Icon(Icons.search, size: 30, color: Const.background),
        onPressed: onSearch,
      ),
    ],
    centerTitle: true,
    elevation: 0,
    backgroundColor: Const.maincolour,
    title: Text(
      Const.appname,
      style: TextStyle(
        color: Const.fontcolour,
        fontFamily: Const.mainfont,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
