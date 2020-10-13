import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "https://jsonplaceholder.typicode.com/posts";
  Widget loading = Container();
  String response = "No response yet";
  List<Widget> items = List();

  ViewController controller = ViewController();

  @override
  Widget build(BuildContext context) {
    print("build method recalled");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("api consume"),
      ),
      body: ListView(
            children: [
              MaterialButton(
                onPressed: () {

              
                },
                child: Text("show snackbar"),
                color: Colors.blue,
              ),
              loading,
              MaterialButton(
                onPressed: () async {
                  http.post(url).then((res) {
                    print(res.body);
                  });

                  // List<Widget> temp = await getPost();

                  controller.setResponse("Successfully updated");
                },
                child: Obx(()=>Text(controller.response),),
                color: Colors.white,
              ),

             Obx(()=> Text(controller.response))
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: items,
              // )
            ],
          ),
    );
  }

  Future<List<Widget>> getPost() async {
    List<Widget> itemList = List();
    http.Response res = await http.get(url);
    List converted = convert.jsonDecode(res.body);

    for (Map<String, dynamic> each in converted) {
      itemList.add(eachElement(each));
    }

    return itemList;
  }

  Widget eachElement(Map<String, dynamic> body) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 2, spreadRadius: 0.5, offset: Offset(1, 1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            body['title'],
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Text(
            body['body'],
            style: GoogleFonts.sansita(color: Colors.red),
          )
        ],
      ),
    );
  }
}

class ViewController extends GetxController {
  
  RxString _response = "initial data".obs;

  String get response => _response.value;
  setResponse(String res) {
    _response.value = res;
  }
}
