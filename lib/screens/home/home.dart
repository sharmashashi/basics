import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      bottomNavigationBar: navBar(),
    );
  }

  Widget navBar() {
    return BottomNavigationBar(
      unselectedItemColor: light,
      selectedItemColor: blue,
      showUnselectedLabels: true,
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
