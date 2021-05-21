import 'package:flutter/Material.dart';

class Const {
  Const._privateConstructor();

  static String appname = "Teacher Do";
  static String mainfont = "Main";

  static Color maincolour = Color.fromARGB(900, 209, 95, 55);
  static Color background = Colors.white;
  static Color fontcolour = Colors.white;
  static Color darkMainColour = Colors.black;
  static Color error = Colors.red;

  static List<String> database = <String>["Teacher.db"];

  static List<String> app = <String>[
    "Add Notes".toUpperCase(), // 0
    "About".toUpperCase(), // 1
    "Okay".toUpperCase(), // 2
    "Support This Project".toUpperCase(), // 3
  ];

  static String aboutText =
      "This Application Created By John Melody Me. \n\nWould You Like to Support the project by donating to the developer?";

  static String url = "https://johnmelodyme.github.io/donate/";
}
