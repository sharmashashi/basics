import 'package:flutter/widgets.dart';

class HomeProvider with ChangeNotifier {
  String _title = "Initial value";
  String get title => _title;

  set setTitle(String str) {
    _title = str;
    notifyListeners();
  }
}
