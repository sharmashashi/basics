import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieGroupController{
  RxList<Widget> _popularMovies = [_loading(), _loading()].obs;
  List<Widget> get popularMovies => _popularMovies;
  set setPopularMovies(List<Widget> list) {
    _popularMovies.value = list;
  }

  static Widget _loading() => Center(child: CircularProgressIndicator());
}