import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context).settings.arguments;
    print(arg);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("This is third page"),
      ),
      body: Center(
          child: MaterialButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pop(context);

                Navigator.popUntil(context, ModalRoute.withName("/login"));
              },
              color: Colors.amber,
              child: Text("go to login"))),
    );
  }
}
