import 'package:flutter/material.dart';
import 'package:teacherdo/database/database.dart';

import 'package:teacherdo/pages/noteslist.dart';
import 'package:teacherdo/widgets/appbar.dart';
import 'package:teacherdo/widgets/floatingaction.dart';

class MainPages extends StatefulWidget {
  @override
  _MainPagesState createState() {
    return _MainPagesState();
  }
}

class _MainPagesState extends State<MainPages> {
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: FutureBuilder(
        future: database.getNotes(),
        builder: (context, snapshot) {
          dynamic data = snapshot.data;

          return (() {
            if (snapshot.hasData) {
              return DisplayNotes(notes: data);
            } else {
              return Center(
                child: Text(
                  "No Notes",
                  style: TextStyle(color: Colors.black45),
                ),
              );
            }
          }());
        },
      ),
    );
  }
}
