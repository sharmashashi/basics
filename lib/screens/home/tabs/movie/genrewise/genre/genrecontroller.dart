import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class GenreController extends GetxController {
  
  RxList<Widget> _movieList = [_loading()].obs;
  List<Widget> get movieList => _movieList.value;
  set setMovieList(List<Widget> list) {
    _movieList.value = list;
  }

  static Widget _loading() => Center(
        child: CircularProgressIndicator(),
      );
}
