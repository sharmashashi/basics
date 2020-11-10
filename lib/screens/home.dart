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
            onPressed: () async {
              Database db = await _database();
              List queryResult = await db.query("time");
              print(queryResult);
            },
            child: Icon(Icons.list),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              Database db = await _database();
              await db.insert("time", {
                "hour": DateTime.now().hour.toString(),
                "minute": DateTime.now().minute.toString(),
                "seconds": DateTime.now().second.toString()
              });
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
