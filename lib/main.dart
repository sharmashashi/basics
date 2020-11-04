import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/screens/auto_update_list.dart';
import 'package:firstproject/screens/home.dart';
import 'package:firstproject/screens/streams_example.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: AutoUpdateList()));
}
