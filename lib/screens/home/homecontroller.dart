import 'package:firstproject/screens/home/tabs/mine/mine.dart';
import 'package:firstproject/screens/home/tabs/movie/movie.dart';
import 'package:firstproject/screens/home/tabs/ranking/ranking.dart';
import 'package:firstproject/screens/home/tabs/search/seach.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  List<Widget> _pages = [Movie(), MovieRanking(), MovieSearch(), Mine()];

  Rx<Widget> _page = _initial().obs;
  Widget get page => _page.value;

  RxInt _index = 0.obs;
  int get index => _index.value;
  set setPage(int ix) {
    _page.value = _pages[ix];
    _index.value = ix;
  }

  static Widget _initial() => Movie();
}
