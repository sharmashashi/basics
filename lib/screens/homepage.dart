import 'dart:io';

import 'package:firstproject/screens/tabs/hometab.dart';
import 'package:firstproject/screens/tabs/mypaymenttab.dart';
import 'package:firstproject/screens/tabs/offerstab.dart';
import 'package:firstproject/screens/tabs/statementstab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  int pageIndex = 0;
  List<Widget> pages = [
    HomeTab(),
    StatementsTab(),
    MyPaymentTab(),
    OffersTab()
  ];
  BottomNavigationBarItem eachItem(
      {@required IconData iconData, @required String title}) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.green.shade50,
        activeIcon: Icon(
          iconData,
          color: Colors.green,
        ),
        icon: Icon(
          iconData,
          color: Colors.grey,
        ),
        title: Text(title));
  }

  Widget navBar() {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        items: [
          eachItem(title: "Home", iconData: Icons.home),
          eachItem(title: "Statements", iconData: Icons.description),
          eachItem(title: "My Payment", iconData: Icons.assignment),
          eachItem(title: "Offers", iconData: Icons.monetization_on),
        ]);
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        bottomNavigationBar: navBar(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          leading: Container(),
          title: Text("Home"),
        ),
        body: pages[pageIndex],
      ),
    );
  }
}
