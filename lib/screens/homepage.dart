import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final String argument;
  HomePage(this.argument);

  @override
  Widget build(BuildContext context) {
    print(argument);
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("you wanna a exit?"),
                actions: [
                  MaterialButton(
                    child: Text("No"),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MaterialButton(
                    child: Text("Yes"),
                    color: Colors.white,
                    onPressed: () {
                      exit(0);
                    },
                  ),
                ],
              );
            });
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(icon: Icon(Icons.arrow_forward),)
          // ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("This page2"),
        ),
        body: Center(
            child: Column(
          children: [
            MaterialButton(
              child: Text("Go to third page"),
              color: Colors.purple,
              onPressed: () {
                Map<dynamic, dynamic> map = {"id": 1, "data": "this is data"};
                Navigator.of(context).pushNamed("/thirdpage", arguments: map);
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => ThirdPage()));
              },
            ),
            MaterialButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                String id = pref.getString('id');
                String password = pref.getString('password');
                print(id);
                print(password);
              },
              color: Colors.cyan,
              child: Text("get id/pwd"),
            ),
          ],
        )),
      ),
    );
  }
}
