import 'package:firstproject/screens/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Get.to(ThirdPage());
            },
            child: Text("go to third page"),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
