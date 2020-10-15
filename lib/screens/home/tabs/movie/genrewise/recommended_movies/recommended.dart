import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  final double height;
  Recommended(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text("this is recommended "),
      ),
    );
  }
}
