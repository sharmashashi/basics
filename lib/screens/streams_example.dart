import 'dart:async';

import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  StreamController<String> streamController = StreamController();

  @override
  void initState() {
    // _listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Example"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              streamController.sink.add(DateTime.now().second.toString());
            },
            color: Colors.green,
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
          ),
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData ? Text(snapshot.data) : Text("no data");
            },
          )
        ],
      ),
    );
  }

  _listen() {
    streamController.stream.listen((data) {
      print(data);
    });
  }
}
