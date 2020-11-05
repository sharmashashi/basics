import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File file;
  Widget image = SizedBox();
  Widget uploadedImage = SizedBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image upload"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                PickedFile imageFile =
                    await picker.getImage(source: ImageSource.gallery);

                if (imageFile != null) {
                  file = File(imageFile.path);
                  image = Image.file(
                    file,
                    height: 300,
                  );
                  setState(() {});
                } else {
                  print("image not picked");
                }
              },
              child: Text("Pick Image"),
              color: Colors.blue,
            ),

            ///
            ///
            ///
            ///
            image,

            ///
            ///
            ///
            ///
            ///
            MaterialButton(
              onPressed: () async {
                FirebaseStorage storage = FirebaseStorage.instance;

                StorageReference reference = storage.ref().child("childPath");
                StorageUploadTask upTask = reference.putFile(file);
                
                StorageTaskSnapshot snap = await upTask.onComplete;
                String url = await snap.ref.getDownloadURL();
                setState(() {
                  uploadedImage = Image.network(
                    url,
                    height: 200,
                  );
                });
              },
              child: Text("Upload"),
              color: Colors.green,
            ),

            ////
            ///
            ///
            uploadedImage
          ],
        ),
      ),
    );
  }
}
