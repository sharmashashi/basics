import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Database db =
                await openDatabase(await getDatabasesPath() + "/my_db.db");
            await db.insert("note", {
              "title": titleController.text,
              "note": noteController.text,
              "image": imagePath
            });
            print("note added ");
            Navigator.pop(context);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.save),
      ),
      body: ListView(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter title"),
          ),
          TextField(
            controller: noteController,
            maxLines: 5,
            decoration: InputDecoration(hintText: "Enter note"),
          ),
          _imagePickerBtn(),
          imagePath == null ? SizedBox() : _preview(imagePath)
        ],
      ),
    );
  }

  Widget _imagePickerBtn() {
    return MaterialButton(
      color: Colors.green,
      onPressed: () async {
        PickedFile pickedFile =
            await ImagePicker.platform.pickImage(source: ImageSource.gallery);

        setState(() {
          imagePath = pickedFile.path;
        });
      },
      child: Text(
        "Pick Image",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _preview(String imagePath) {
    return Image.file(
      File(imagePath),
      height: 200,
    );
  }
}
