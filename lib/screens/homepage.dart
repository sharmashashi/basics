import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "This is App bar",
            style: TextStyle(
                backgroundColor: Colors.yellow, fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TextField()
            Image.network(
              "https://www.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png",
              height: 50,
              width: 50,
            ),

            Container(
              height: 100,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            ),
            Container(height: 50, width: 30, color: Colors.red),
            Container(
              height: 30,
              width: 20,
              color: Colors.black,
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            ),
            Text(
              "this is text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue.shade900,
                  fontStyle: FontStyle.italic),
            ),
            MaterialButton(
              elevation: 5,
              onLongPress: () {
                print("Long pressed");
              },
              color: Colors.green.shade700,
              child: Text(
                "press me",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Pressed");
              },
            )
          ],
        ));
  }
}
