import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teacherdo/constant/const.dart';
import 'package:teacherdo/model/model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static String path;
  static DatabaseHelper instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() => instance;

  static String databaseName = Const.database[0];
  static String databaseTable = "TEACHER_NOTES";

  static int databaseVersion = 1;

  Database database;

  Future<Database> get dataBase async {
    if (database != null) {
      return database;
    }

    database = await initiateDatabase();
    return database;
  }

  Future<dynamic> initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);

    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: onCreateDatabase,
    );
  }

  Future<void> onCreateDatabase(Database _database, int version) {
    return _database.execute(
      '''
      CREATE TABLE $databaseTable(
        ID INTEGER PRIMARY KEY,
        TITLE TEXT NOT NULL,
        CONTENT TEXT NOT NULL,
        OBJECTIVE TEXT NOT NULL,
        MATERIALS TEXT NOT NULL,
        STUDENTS INT NOT NULL,
        DATETIME TEXT NOT NULL
      )
      ''',
    );
  }

  Future<int> addNote(Notes notes) async {
    Database db = database;

    int count = await db.insert(
      databaseTable,
      notes.toMap(),
    );

    return count;
  }

  Future<List<Notes>> getNotes() async {
    Database dbClient = await dataBase;

    List<Map> list = await dbClient.rawQuery(
      "SELECT * FROM $databaseTable ORDER BY DATETIME",
    );

    List<Notes> noteData = [];

    for (int i = 0; i < list.length; i++) {
      Notes notes = Notes(
        id: list[i]["id"],
        title: list[i]["title"],
        content: list[i]["content"],
        materials: list[i]["materials"],
        objective: list[i]["objective"],
        students: list[i]["students"],
        date: list[i]["date"],
      );

      noteData.add(notes);
    }

    return noteData;
  }

  Future<bool> updateNote(Notes notes) async {
    Database dbclient = await dataBase;

    int result = await dbclient.update(
      databaseTable,
      notes.toMap(),
      where: "id=?",
      whereArgs: [notes.id],
    );

    return result > 0 ? true : false;
  }

  Future<int> deleteNote(Notes note) async {
    Database db = await dataBase;

    int result = await db.rawDelete(
      "DELETE FROM $databaseTable WHERE ID = ?",
      [note.id],
    );

    return result;
  }

  Future<int> deleteAllNotes() async {
    Database db = await dataBase;
    return await db.delete(databaseTable);
  }

  Future<List<Notes>> getNoteList() async {
    Database db = await dataBase;

    List<Map<String, dynamic>> maps = await db.query(databaseTable);

    return List.generate(
      maps.length,
      (index) => Notes(
        id: maps[index]["id"],
        title: maps[index]["title"],
        content: maps[index]["content"],
        materials: maps[index]["materials"],
        objective: maps[index]["objective"],
        students: maps[index]["students"],
        date: maps[index]["date"],
      ),
    );
  }
}
