import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import '../utils/colors.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55.0),
          color: splashBackgroundColor),
      child: const Padding(
        padding: EdgeInsets.all(0.0),
        child: SafeArea(
          child: GNav(
            backgroundColor: bgWhite,
            color: primaryBgColor,
            activeColor: primaryBgColor,
            //tabBackgroundColor: Colors.amberAccent,
            gap: 5,
            tabs: [
              GButton(
                icon: CACSAIcons.homebold,
                text: "Home",
              ),
              GButton(
                icon: CACSAIcons.calendarbold,
                text: "Event",
              ),
              GButton(
                icon: CACSAIcons.notificationbold,
                text: "Notification",
              )
            ],
            selectedIndex: 0,
          ),
        ),
      ),
    );
  }
}
