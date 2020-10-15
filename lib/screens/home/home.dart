import 'package:firstproject/screens/home/homecontroller.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      bottomNavigationBar: Obx(
        () => navBar(),
      ),
      body: Obx(() => _homeController.page),
    );
  }

  Widget navBar() {
    return BottomNavigationBar(
      unselectedItemColor: grey,
      selectedItemColor: blue,
      currentIndex: _homeController.index,
      showUnselectedLabels: true,
      onTap: (index) {
        _homeController.setPage = index;
      },
      items: [
        itemBuilder(
            icon: FaIcon(
              FontAwesomeIcons.compactDisc,
            ),
            title: "Movie"),
        itemBuilder(icon: FaIcon(FontAwesomeIcons.trophy), title: "Ranking"),
        itemBuilder(icon: FaIcon(FontAwesomeIcons.search), title: "Find"),
        itemBuilder(icon: FaIcon(FontAwesomeIcons.userAlt), title: "Mine"),
      ],
    );
  }

  BottomNavigationBarItem itemBuilder(
      {@required Widget icon, @required String title}) {
    return BottomNavigationBarItem(
        icon: icon, title: Text(title), backgroundColor: primarylight);
  }
}
