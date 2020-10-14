import 'package:firstproject/screens/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First page")),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Get.to(SecondPage());
            },
            child: Text("go to second page"),
            color: Colors.green,
          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/third");
            },
            child: Text("go to third page"),
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}
