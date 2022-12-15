import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/notifications/notifications.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import "package:get/get.dart";
//import '../utils/colors.dart';

class MyNavBar extends StatelessWidget {
  final int colorNum;
  const MyNavBar({Key? key, required this.colorNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(color: primaryBgColor),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: splashBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SafeArea(
            child: GNav(
              backgroundColor: bgWhite,
              color: textColorBlack,
              activeColor: primaryBgColor,
              //tabBackgroundColor: Colors.amberAccent,
              gap: 5,
              tabs: [
                GButton(
                  icon: colorNum == 1
                      ? CACSAIcons.homenormal
                      : CACSAIcons.homebold,
                  onPressed: () {
                    Get.offAndToNamed(Routes.MAIN_PAGE);
                  },
                ),
                GButton(
                  icon: colorNum == 2
                      ? CACSAIcons.calendarbold
                      : CACSAIcons.calendarnormal,
                  onPressed: () {
                    Get.toNamed(Routes.EVENTS);
                  },
                ),
                GButton(
                  icon: colorNum == 2
                      ? CACSAIcons.calendarbold
                      : CACSAIcons.notificationnormal,
                  onPressed: () {
                    Get.to(() => NotificationWidget());
                  },
                )
              ],
              selectedIndex: 0,
            ),
          ),
        ),
      ),
    );
  }
}
