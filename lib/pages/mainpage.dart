import 'package:flutter/material.dart';
import 'package:teacherdo/widgets/appbar.dart';
import 'package:teacherdo/widgets/floatingaction.dart';

class MainPages extends StatefulWidget {
  @override
  _MainPagesState createState() {
    return _MainPagesState();
  }
}

class _MainPagesState extends State<MainPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
