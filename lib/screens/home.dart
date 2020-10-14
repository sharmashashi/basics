import 'package:firstproject/screens/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        child: Builder(builder: (context) {
          HomeProvider homeProvider = Provider.of<HomeProvider>(context);

          return Column(
            children: [
              MaterialButton(
                onPressed: () {
                  homeProvider.setTitle = "Updated";
                },
                child: Text("update text"),
                color: Colors.blue,
              ),
              Text(homeProvider.title)
            ],
          );
        }),
      ),
    );
  }
}
