import 'package:firstproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _createDatabase();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Notes()));
}

int databaseVersion = 3;

Future<void> _createDatabase() async {
  String path = await getDatabasesPath();
  Database databaseRef =
      await openDatabase(path + "/my_db.db", onCreate: (db, version) async {
    String createQuery =
        "CREATE TABLE time(id INTEGER primary key autoincrement,hour TEXT, minute TEXT, seconds TEXT)";
    await db.execute(createQuery);
    String createNote =
        "CREATE TABLE note(id INTEGER primary key autoincrement,title TEXT, note TEXT, image TEXT)";
    await db.execute(createNote);
  }, onUpgrade: (db, oldVersion, newVersion) async {
    print(oldVersion);
    print(newVersion);

    String createQuery =
        "CREATE TABLE note(id INTEGER primary key autoincrement,title TEXT, note TEXT, image TEXT)";
    await db.execute(createQuery);
  }, version: databaseVersion);
}
