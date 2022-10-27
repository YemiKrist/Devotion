import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import '../utils/colors.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GNav(
        backgroundColor: splashBackgroundColor,
        color: primaryBgColor,
        tabs: [
          GButton(
            icon: FontAwesomeIcons.house,
          ),
          GButton(icon: FontAwesomeIcons.calendar),
          GButton(icon: FontAwesomeIcons.bell)
        ]);
  }
}
