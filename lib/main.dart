import 'package:firstproject/screens/homepage.dart';
import 'package:firstproject/screens/login.dart';
import 'package:flutter/material.dart';

Color colorGreen = Color(0xff41A124);
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => LoginPage(),
        // "/homepage": (context) => HomePage(),
      },
      initialRoute: "/login",
      home: LoginPage()));
}
