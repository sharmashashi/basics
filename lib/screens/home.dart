import 'dart:io';

import 'package:firstproject/screens/add_note.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Widget> _notes = [];

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("you notes"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              _fetchNotes();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
          _fetchNotes();
        },
      ),
      body: ListView(children: _notes),
    );
  }

  _fetchNotes() async {
    Database db = await openDatabase(await getDatabasesPath() + "/my_db.db");
    List resultList = await db.query("note");
    List<Widget> _tempList = List();
    for (var each in resultList) {
      _tempList.add(_noteWidget(each['title'], each['note'], each['image']));
    }
    setState(() {
      _notes = _tempList;
    });
  }

  Widget _noteWidget(String title, String note, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.shade300)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text(title), Text(note)],
          ),
          Image.file(File(imagePath))
        ],
      ),
    );
  }
}
