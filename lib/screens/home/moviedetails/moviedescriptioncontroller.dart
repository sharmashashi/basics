import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MovieDescriptionController extends GetxController {
  RxList<Widget> _castList = [_loading()].obs;
  List<Widget> get castList => _castList.value;
  set setCastList(List<Widget> list) {
    _castList.value = list;
  }

  static Widget _loading() => Center(child: CircularProgressIndicator());
}
