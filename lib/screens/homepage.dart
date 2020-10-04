import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          Navigator.of(context).pushNamed("/thirdpage");
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => ThirdPage()));
        },
      )),
    );
  }
}
