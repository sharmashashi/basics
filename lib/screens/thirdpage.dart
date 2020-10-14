import 'package:firstproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("third page"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                Get.offAll(Home());
              },
              child: Text("go to first page"),
              color: Colors.white,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("test apis"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
