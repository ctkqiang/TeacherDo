import 'package:flutter/Material.dart';
import 'package:teacherdo/constant/const.dart';
import 'package:teacherdo/pages/add.dart';
import 'package:teacherdo/pages/mainpage.dart';

class TeacherDo extends StatefulWidget {
  @override
  _TeacherDoState createState() {
    return _TeacherDoState();
  }
}

class _TeacherDoState extends State<TeacherDo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Const.appname,
      initialRoute: "/",
      routes: {
        "/": (context) => MainPages(),
        "/splash": (context) => null,
        "/add": (context) => AddNotes(),
      },
    );
  }
}
