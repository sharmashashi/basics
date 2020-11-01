import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatImages extends StatefulWidget {
  @override
  _CatImagesState createState() => _CatImagesState();
}

class _CatImagesState extends State<CatImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Cats")),
      body: Column(
        children: [_getCats()],
      ),
    );
  }

  Widget _getCats() {
    String apiKey = "f1d76257-6fd7-4c99-a3cb-5441f763878f";
    return MaterialButton(
      onPressed: () async {
        // http.Response response = await http
        //     .get("https://api.thecatapi.com/v1/images/search?api_key=$apiKey");
        // print(response.body);

        http.Response createVote = await http.post(
            "https://api.thecatapi.com/v1/votes",
            headers: {"x-api-key": apiKey},
            body: {"image_id": "asf2", "sub_id": "my-user-1234", "value": 1});
        print(createVote.body);
      },
      child: Text("Get cats"),
      color: Colors.green,
    );
  }
}
