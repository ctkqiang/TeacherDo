import 'package:flutter/material.dart';
import 'package:teacherdo/model/model.dart';

// ignore: must_be_immutable
class DisplayNotes extends StatefulWidget {
  List<Notes> notes;

  DisplayNotes({Key key, this.notes}) : super(key: key);

  @override
  _DisplayNotesState createState() => _DisplayNotesState();
}

class _DisplayNotesState extends State<DisplayNotes> {
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
      ),
      itemCount: widget.notes.length == null ? 0 : widget.notes.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (BuildContext context) =>
            //     DisplayNotes(widget.notes[i], false),
            // ));
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text(
                    widget.notes[i].title,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.notes[i].content,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Created: ${widget.notes[i].title}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Modified: ${widget.notes[i].date}"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
