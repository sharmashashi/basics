import 'package:firebase_storage/firebase_storage.dart';
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

  String _imageUrl;

  ///
  ///
  ///
  pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      _imagePreview.value = Image.file(
        imageFile,
        height: 300,
      );
      _imageUrl = await _uploadImage(imageFile);
    } else {}
  }

  Future<String> _uploadImage(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    StorageReference reference = storage.ref().child(_docId);
    StorageUploadTask upTask = reference.putFile(image);
    StorageTaskSnapshot snap = await upTask.onComplete;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  ///
  ///
  addNote() {
    
  }
}
