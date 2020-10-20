import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RecommendedController extends GetxController {
  RxList<Widget> _sliderItems = [_loading(), _loading()].obs;
  List<Widget> get sliderItems => _sliderItems;
  set setSliderItems(List<Widget> list) {
    _sliderItems.value = list;
  }

  // RxList<Widget> _popularMovies = [_loading(), _loading()].obs;
  // List<Widget> get popularMovies => _popularMovies;
  // set setPopularMovies(List<Widget> list) {
  //   _popularMovies.value = list;
  // }

  static Widget _loading() => Center(child: CircularProgressIndicator());
}
