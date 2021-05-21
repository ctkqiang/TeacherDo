import 'package:flutter/material.dart';
import 'package:teacherdo/constant/const.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildAboutDialog(BuildContext context) {
  void onPressedPop() => Navigator.pop(context);

  Future<void> onPressedOpenUrl() async {
    String url = Const.url;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  return AlertDialog(
    title: Text("About ${Const.appname}", textAlign: TextAlign.center),
    content: Container(
      width: MediaQuery.of(context).size.width * 3.45,
      height: MediaQuery.of(context).size.height - 650,
      child: Column(
        children: <Widget>[aboutText(context)],
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: onPressedPop,
        child: Text(
          Const.app[2],
          style: TextStyle(color: Const.background),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Const.maincolour,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Const.maincolour),
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: onPressedOpenUrl,
        child: Text(
          Const.app[3],
          style: TextStyle(color: Const.background),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Const.error,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Const.error),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget aboutText(BuildContext context) {
  return Column(
    children: [
      Text(
        Const.aboutText,
        style: TextStyle(color: Const.darkMainColour, fontSize: 20),
      ),
    ],
  );
}
