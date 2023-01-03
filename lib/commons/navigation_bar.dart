import 'dart:developer';

import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/controllers/navigationController.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
//import '../utils/colors.dart';

// class MyNavBar extends StatefulWidget {
//   const MyNavBar({Key? key}) : super(key: key);

//   @override
//   State<MyNavBar> createState() => _MyNavBarState();
// }

// class _MyNavBarState extends State<MyNavBar> {
//   final controller = Get.put(NavigationController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(color: splashBackgroundColor),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           getIcons(CACSAIcons.homenormal, 1, "Home", 'main_page'),
//           getIcons(CACSAIcons.calendarnormal, 2, "Events", 'events'),
//           getIcons(CACSAIcons.notificationnormal, 3, "Notification",
//               'notifications'),
//         ]),
//       ),
//     );
//   }

//   Widget getIcons(IconData icon, int index, String pageName, String route) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           controller.currentIndex = index;
//         });
//         Get.toNamed('/$route');
//       },
//       child: Container(
//         decoration: const BoxDecoration(color: splashBackgroundColor),
//         child: Column(children: [
//           Icon(
//             icon,
//             color: index == controller.currentIndex
//                 ? primaryBgColor
//                 : Colors.black,
//           ),
//           Text(
//             pageName,
//             style: TextStyle(
//                 color: index == controller.currentIndex
//                     ? primaryBgColor
//                     : Colors.black),
//           )
//         ]),
//       ),
//     );
//   }
// }

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  final controller = Get.put(NavigationController());
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      log(index.toString());
      selectedIndex = index;
      controller.currentIndex = index;
      if (controller.currentIndex == 0) {
        Get.toNamed('/main_page');
      } else if (controller.currentIndex == 1) {
        Get.toNamed('/events');
      } else if (controller.currentIndex == 2) {
        Get.toNamed('/notifications');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: splashBackgroundColor),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: splashBackgroundColor,
        currentIndex: controller.currentIndex,
        selectedLabelStyle: const TextStyle(
          color: primaryBgColor,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CACSAIcons.homenormal,
              color:
                  controller.currentIndex == 0 ? primaryBgColor : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CACSAIcons.calendarnormal,
              color:
                  controller.currentIndex == 1 ? primaryBgColor : Colors.black,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CACSAIcons.notificationnormal,
              color:
                  controller.currentIndex == 2 ? primaryBgColor : Colors.black,
            ),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
