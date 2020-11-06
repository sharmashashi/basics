import 'package:flutter/foundation.dart';

class NoteModel {
  final String title, note, imageUrl, documentId;
  NoteModel(
      {@required this.title,
      @required this.note,
      @required this.imageUrl,
      @required this.documentId});

  Map<String, dynamic> toMap() => {
        "title": title,
        "note": note,
        "imageUrl": imageUrl,
        "documentId": documentId
      };
}
