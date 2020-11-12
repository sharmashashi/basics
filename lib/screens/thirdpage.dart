import 'dart:math';

import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    // controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
        // controller.reset();
        // controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              onPressed: () {
                controller.forward();
              },
              child: Text("Forward"),
              color: Colors.white,
            ),
            FlatButton(
              onPressed: () {
                controller.reverse();
              },
              child: Text("Reverse"),
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedBuilder(
              animation: animation,
              builder: (context, wd) {
                print(animation.value);
                return Center(
                  child: Transform.rotate(
                    angle: pi * animation.value,
                    child: Container(
                      // height: 200.0 + 100 * animation.value,
                      // width: 200.0 + 100 * animation.value,
                      height: 200,
                      width: 200,

                      decoration: BoxDecoration(
                          // color: Colors.green,
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.black,
                                Colors.indigo
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.9 * animation.value, 1]),
                          borderRadius:
                              BorderRadius.circular(50 * animation.value)),
                    ),
                  ),
                );
              }),
          Transform.rotate(
            angle: pi / 2,
            child: Text("Text"),
          ),
          Transform.scale(
            scale: 3,
            child: Icon(
              Icons.accessibility,
              size: 40,
            ),
          ),
          Transform.translate(
            offset: Offset(49, 40),
            child: Icon(
              Icons.accessibility,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
