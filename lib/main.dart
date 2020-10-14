import 'package:firstproject/screens/home.dart';
import 'package:firstproject/screens/secondpage.dart';
import 'package:firstproject/screens/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(routes: {
    '/first':(context)=>Home(),
    '/second': (context) => SecondPage(),
    '/third': (context) => ThirdPage()
  }, debugShowCheckedModeBanner: false, home: Home()));
}
