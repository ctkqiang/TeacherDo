import 'package:flutter/material.dart';
import 'package:teacherdo/constant/const.dart';
import 'package:teacherdo/widgets/about.dart';

Widget appBar(BuildContext context) {
  void onPopUp(dynamic value) {
    if (value == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) => buildAboutDialog(context),
      );
    }
  }

  void onSearch() {}

  PopupMenuButton popup = PopupMenuButton(
    onSelected: onPopUp,
    color: Const.background,
    itemBuilder: (context) => <PopupMenuEntry>[
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            Padding(
              child: Icon(Icons.info, color: Const.darkMainColour),
              padding: EdgeInsets.only(right: 18),
            ),
            Text(Const.app[1]),
          ],
        ),
      ),
    ],
  );

  return AppBar(
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search, size: 30, color: Const.background),
        onPressed: onSearch,
      ),
      popup,
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
