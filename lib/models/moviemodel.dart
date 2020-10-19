import 'package:flutter/foundation.dart';

class MovieModel {
  String title, description, coverImageUrl;
  var rating;
  List genres;
  List torrents;
  int runtime;

  MovieModel(
      {@required this.title,
      @required this.description,
      @required this.coverImageUrl,
      @required this.rating,
      @required this.genres,
      @required this.torrents,
      @required this.runtime});

  String get getTitle => title;
  String get getDescription => description;
  String get getImageUrl => coverImageUrl;
   get getRating => rating;
  int get getRuntime => runtime;
  List get getGenres => genres;
  List get getTorrents => torrents;
}
