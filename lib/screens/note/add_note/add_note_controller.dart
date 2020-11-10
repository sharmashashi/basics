import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstproject/screens/note/note_model.dart';
import 'package:get/get.dart';
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
    _progress(show: true);
    FirebaseFirestore ins = FirebaseFirestore.instance;
    String _imageUrl = "";
    _imageUrl = await _uploadImage();
    NoteModel note = NoteModel(
        title: titleController.text,
        note: noteController.text,
        documentId: _docId,
        imageUrl: _imageUrl);
    await ins
        .collection(FirebaseAuth.instance.currentUser.email)
        .doc(_docId)
        .set(note.toMap());
    _progress(show: false);
  }

  _progress({@required bool show}) {
    if (show) {
      Get.rawSnackbar(
          duration: Duration(minutes: 5),
          messageText: Text("Saving"),
          backgroundColor: Colors.white,
          margin: EdgeInsets.all(8),
          overlayBlur: 4,
          borderRadius: 10,
          isDismissible: false,
          overlayColor: Colors.black12);
    } else {
      if (Get.isSnackbarOpen) Get.back();
      Get.back();
    }
  }
}
