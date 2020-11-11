import 'package:firstproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _createDatabase();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

int databaseVersion = 1;

Future<void> _createDatabase() async {
  String path = await getDatabasesPath();
  Database databaseRef =
      await openDatabase(path + "/my_db.db", onCreate: (db, version) async {
    String createQuery =
        "CREATE TABLE time(id INTEGER primary key autoincrement,hour TEXT, minute TEXT, seconds TEXT)";
    await db.execute(createQuery);
  }, version: 1);
}
