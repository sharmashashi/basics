import 'dart:io';

import 'package:flutter/material.dart';

class SettingsExample extends StatelessWidget {
  final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.grey));
  Widget menuDrawer(
      {@required BuildContext context,
      @required Color boxColor,
      IconData iconData,
      @required String heading,
      @required String subtitle,
      @required bool isImageIcon,
      String iconPath}) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: isImageIcon == true
                  ? ImageIcon(
                      AssetImage(iconPath),
                      color: Colors.white,
                    )
                  : Icon(
                      iconData,
                      color: Colors.white,
                    ),
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(100)),
            ),
          ),

          ///
          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(heading,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 45,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search settings',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: borderStyle,
            enabledBorder: borderStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        title: searchBar(context),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          menuDrawer(
              isImageIcon: true,
              iconPath: "assets/wifi.png",
              context: context,
              boxColor: Colors.blue,
              heading: "Network & internet",
              subtitle: "Wi-Fi,mobile,data usage,hotspot"),
          menuDrawer(
              isImageIcon: false,
              context: context,
              boxColor: Colors.green,
              iconData: Icons.devices,
              heading: "Connected devices",
              subtitle: "Bluetooth,Cast,NFC")
        ],
      ),
    );
  }
}
