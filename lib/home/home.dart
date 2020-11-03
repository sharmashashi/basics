import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _editingController = TextEditingController();
  String data = "Initial";
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firebase CRUD",
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _editingController,
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Create"),
            onPressed: () async {
              FirebaseFirestore ins = FirebaseFirestore.instance;
              Map<String, dynamic> data = {
                "typedText": _editingController.text
              };
              // await ins.collection("message").doc("first").set(data);
              await ins.collection("message").doc("second").set(data);
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Read"),
            onPressed: () async {
              FirebaseFirestore ins = FirebaseFirestore.instance;
              DocumentSnapshot snapshot =
                  await ins.collection("message").doc("second").get();
              String _data = snapshot.data().toString();
              setState(() {
                data = _data;
              });
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Update"),
            onPressed: () async {
              FirebaseFirestore ins = FirebaseFirestore.instance;
              Map<String, dynamic> data = {
                "datetime": DateTime.now().toIso8601String()
              };
              await ins.collection("message").doc("first").update(data);
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Delete"),
            onPressed: () async {
              FirebaseFirestore ins = FirebaseFirestore.instance;
              await ins.collection("message").doc("second").delete();
            },
          ),
          Text("Data from firestore: $data")
        ],
      ),
    );
  }
}
