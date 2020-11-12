import 'package:firstproject/screens/secondpage.dart';
import 'package:firstproject/screens/thirdpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _height = 200;
  double _width = 200;
  Color _color = Colors.purple;
  Alignment _alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              onPressed: () {
                _height = 100;
                _width = 100;
                _color = Colors.green;
                _alignment = Alignment.centerLeft;
                setState(() {});
              },
              color: Colors.white,
              child: Text("Animate"),
            ),
            FlatButton(
              onPressed: () {
                _height = 300;
                _width = 300;
                _color = Colors.purple;
                _alignment = Alignment.center;
                setState(() {});
              },
              color: Colors.white,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Third()));
              },
              child: AnimatedContainer(
                child: Text("I am a box"),
                alignment: _alignment,
                curve: Curves.easeInOutQuart,
                decoration: BoxDecoration(color: _color),
                duration: Duration(seconds: 1),
                height: _height,
                width: _width,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => SecondPage()));
            //   },
            //   child: Hero(
            //     tag: "wifi",
            //                   child: Image.asset(
            //       "assets/wifi.png",
            //       height: 100,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
