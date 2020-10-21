import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class CastModel {
  String actorName, characterName, imageUrl;
  CastModel(
      {@required this.actorName,
      @required this.characterName,
      @required this.imageUrl});

  String get getActorName => actorName;
  String get getCharacterName => characterName;
  String get getImageUrl => imageUrl;
}
