import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstproject/screens/note/note_model.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddNoteController extends GetxController {
  static Widget widget() => SizedBox();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String _docId = DateTime.now().toString();

  Rx<Widget> _imagePreview = widget().obs;
  Widget get imagePreview => _imagePreview.value;

  File imageFile;

  ///
  ///
  ///
  pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      _imagePreview.value = Image.file(
        imageFile,
        height: 300,
      );
    } else {}
  }

  Future<String> _uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    StorageReference reference = storage.ref().child(_docId);
    StorageUploadTask upTask = reference.putFile(imageFile);
    StorageTaskSnapshot snap = await upTask.onComplete;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  ///
  ///
  addNote() async {
    FirebaseFirestore ins = FirebaseFirestore.instance;
    String _imageUrl = await _uploadImage();
    NoteModel note = NoteModel(
        title: titleController.text,
        note: noteController.text,
        documentId: _docId,
        imageUrl: _imageUrl);
    await ins.collection("notes").doc(_docId).set(note.toMap());
  }
}
