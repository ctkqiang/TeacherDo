import 'package:flutter/material.dart';
import 'package:teacherdo/constant/const.dart';

Widget floatingActionButton(BuildContext context) {
  return FloatingActionButton.extended(
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    tooltip: "Add",
    onPressed: () => Navigator.pushNamed(
      context,
      '/add',
      arguments: Duration(seconds: 0),
    ),
    label: Text(
      Const.app[0],
      style: TextStyle(color: Const.fontcolour),
    ),
    icon: Icon(Icons.add),
    backgroundColor: Const.maincolour,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(80.0)),
    ),
  );
}
