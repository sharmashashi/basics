import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/screens/note/add_note/add_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDemo extends StatefulWidget {
  @override
  _NoteDemoState createState() => _NoteDemoState();
}

class _NoteDemoState extends State<NoteDemo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  FirebaseFirestore ins = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: _floatingButton(context),
      body: StreamBuilder(
        stream: ins.collection("notes").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<QueryDocumentSnapshot> documentList = snapshot.data.docs;
          return snapshot.hasData == false
              ? Text("no Data")
              : ListView.builder(
                  itemCount: documentList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> noteMap = documentList[index].data();

                    return _note(
                        title: noteMap['title'],
                        note: noteMap['note'],
                        documentId: noteMap['docId']);
                  });
        },
      ),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        Get.to(AddNote());
        // showDialog(
        //     context: context,
        //     builder: (context) => SimpleDialog(
        //           title: Text("Add Note"),
        //           children: [
        //             _field(controller: titleController, hint: "title"),
        //             _field(controller: noteController, hint: "note"),
        //             _addBtn(
        //                 title: titleController.text, note: noteController.text)
        //           ],
        //         ));
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget _addBtn({String title, String note}) {
    return MaterialButton(
      onPressed: () async {
        await _addNoteToFirestore(title: title, note: note);
      },
      child: Text("Add to note"),
      color: Colors.green,
    );
  }

  Future<bool> _addNoteToFirestore({String title, String note}) async {
    title = titleController.text;
    bool ret = false;

    note = noteController.text;
    print(title);
    print(note);
    String documentId = DateTime.now().toIso8601String();
    if (title != "" && note != "") {
      await ins
          .collection('notes')
          .doc(documentId)
          .set({"title": title, "note": note, "docId": documentId});
      titleController.clear();
      noteController.clear();
      Navigator.pop(context);
      ret = true;
    } else {}

    return ret;
  }

  TextField _field({TextEditingController controller, String hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }

  Widget _note({String title, String note, String documentId}) {
    return GestureDetector(
      onLongPress: () async {
        ins.collection("notes").doc(documentId).delete();
      },
      child: Card(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(note)
            ],
          ),
        ),
      ),
    );
  }
}
