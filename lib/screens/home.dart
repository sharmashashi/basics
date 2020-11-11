import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () async {
              Database db = await _database();
              String sql = "DELETE FROM time WHERE id=?";
              await db.rawDelete(sql, [5]);
            },
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              Database db = await _database();
              String sql =
                  "UPDATE time SET hour=?,minute=?,seconds=? WHERE id=?";
              await db.rawUpdate(sql, ["raw update value", "new", "new", 5]);
            },
            child: Icon(Icons.save),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () async {
              Database db = await _database();
              // String sql = "SELECT * FROM time";
              String sql = "SELECT id,seconds FROM time where id=?";
              List queryResult = await db.rawQuery(sql, [6]);
              print(queryResult);
              print(await db.query("time"));
            },
            child: Icon(Icons.list),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              Database db = await _database();
              String sql =
                  "INSERT INTO time(hour,minute,seconds) VALUES(?,?,? )";
              db.rawInsert(sql, ["new insert", "new ", "new"]);

              String alternativeSql =
                  "INSERT INTO time(hour,minute,seconds) VALUES('new','new','new')";
              db.rawInsert(alternativeSql);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }

  Future<Database> _database() async =>
      await openDatabase(await getDatabasesPath() + "/my_db.db");
}
