import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Widget greenBackground(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff41A124),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          greenBackground(context),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.025,
              top: MediaQuery.of(context).size.height * 0.1,
              child: contentPage1(context)),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: MediaQuery.of(context).size.width * 0.025,
              child: contentPage2(context))
        ],
      ),
    );
  }

  Widget contentPage2(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          rowBuilder([
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.battery_charging_full, lable: "Electricity"),
            top2ItemBuilder(iconData: Icons.power_input, lable: "Khanepani"),
            top2ItemBuilder(iconData: Icons.wifi, lable: "Internet")
          ]),
          rowBuilder([
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(iconData: Icons.mobile_screen_share, lable: "Topup")
          ]),
          rowBuilder([
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(iconData: Icons.mobile_screen_share, lable: "Topup")
          ]),
          rowBuilder([
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            top2ItemBuilder(
                iconData: Icons.mobile_screen_share, lable: "Topup"),
            Container()
          ]),
        ],
      ),
    );
  }

  Widget rowBuilder(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget contentPage1(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(1,1),
        //     blurRadius: 3,
        //     spreadRadius: 0.1,
        //     color: Colors.grey.shade300
        //   )
        // ]
      ),
      child: Column(
        children: [top1(context), top2(context)],
      ),
    );
  }

  Widget top2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.12,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          top2ItemBuilder(iconData: Icons.calendar_today, lable: "Load Money"),
          top2ItemBuilder(iconData: Icons.share, lable: "Send Money"),
          top2ItemBuilder(iconData: Icons.work, lable: "Bank Transfer"),
          top2ItemBuilder(iconData: Icons.monetization_on, lable: "Remitance"),
        ],
      ),
    );
  }

  Widget top2ItemBuilder(
      {@required IconData iconData, @required String lable}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: colorGreen,
        ),
        Container(
          height: 10,
        ),
        Text(
          lable,
          style: TextStyle(color: Colors.grey.shade800),
        )
      ],
    );
  }

  Widget top1(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.web_asset, color: colorGreen),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('NPR 57.77'), Text("Balance")],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('305'), Text("Reward points")],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.watch, color: colorGreen),
              )
            ],
          )
        ],
      ),
    );
  }
}
