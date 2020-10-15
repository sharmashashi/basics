import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class MovieController extends GetxController {
  Color disableColor = Colors.grey;
  Color enableColor = Colors.blue;
  RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  updateCurrentIndex(int index) {
    _currentIndex.value = index;
  }

  List<String> _movieGenres = [
    'Recommended',
    'Action',
    'Adventure',
    'Comedy',
    'Sci-Fi',
    'Crime',
    'Drama',
    'Romantic',
    'Social',
    'Thriller'
  ];

  Rx<Widget> _genrePage = wd().obs;
  Widget get genrePage=>_genrePage.value;

  List<String> get movieGenres => _movieGenres;

  static Widget wd() => Container();
}
