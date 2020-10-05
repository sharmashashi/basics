import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String argument;
  HomePage(this.argument);

  @override
  Widget build(BuildContext context) {
    print(argument);
    return Scaffold(
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
          child: MaterialButton(
        child: Text("Go to third page"),
        color: Colors.purple,
        onPressed: () {
          Map<dynamic, dynamic> map = {"id":1,"data":"this is data"};
          Navigator.of(context)
              .pushNamed("/thirdpage", arguments: map);
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => ThirdPage()));
        },
      )),
    );
  }
}
