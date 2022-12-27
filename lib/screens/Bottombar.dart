import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/screens/events/upcoming_events.dart';
import 'package:cacsa/screens/notifications/notifications.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({
//     super.key,
//   });

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int selectedItem = 0;

//   final List<Widget> _widgetList = [
//     const WelcomePage(),
//     const UpcomingEvents(),
//     NotificationWidget(),
//   ];

//   void updatedwidget(int index) {
//     setState(() {
//       selectedItem = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         child: Scaffold(
//           body: _widgetList[selectedItem],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: selectedItem,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: primaryBgColor,
//             unselectedItemColor: Colors.black,
//             onTap: (int index) {
//               setState(() {
//                 selectedItem = index;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(selectedItem == 0
//                       ? CACSAIcons.homebold
//                       : CACSAIcons.homenormal),
//                   label: "Home"),
//               BottomNavigationBarItem(
//                   icon: Icon(selectedItem == 1
//                       ? CACSAIcons.calendarbold
//                       : CACSAIcons.calendarnormal),
//                   label: "Events"),
//               BottomNavigationBarItem(
//                   icon: Icon(selectedItem == 2
//                       ? CACSAIcons.notificationbold
//                       : CACSAIcons.notificationnormal),
//                   label: "Notifications"),
//             ],
//           ),
//         ));
//   }
// }
