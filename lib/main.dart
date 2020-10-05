import 'package:firstproject/screens/homepage.dart';
import 'package:firstproject/screens/login.dart';
import 'package:firstproject/screens/thirdpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => LoginPage(),
        // "/homepage": (context) => HomePage(),
        "/thirdpage": (context) => ThirdPage()
      },
      initialRoute: "/login",
      home: LoginPage()));
}
