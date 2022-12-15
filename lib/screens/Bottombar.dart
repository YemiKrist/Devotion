import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/screens/events/upcoming_events.dart';
import 'package:cacsa/screens/notifications/notifications.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedItem = 0;

  final List<Widget> _widgetList = [
    const WelcomePage(),
    const UpcomingEvents(),
    NotificationWidget(),
  ];

  void updatedwidget(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: primaryBgColor,
        body: _widgetList.elementAt(selectedItem),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItem,
          onTap: updatedwidget,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    color: bgWhite,
                  ),
                  child: Icon(selectedItem == 0
                      ? CACSAIcons.homebold
                      : CACSAIcons.homenormal),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    color: bgWhite,
                  ),
                  child: Icon(selectedItem == 1
                      ? CACSAIcons.calendarbold
                      : CACSAIcons.calendarnormal),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    color: bgWhite,
                  ),
                  child: Icon(selectedItem == 2
                      ? CACSAIcons.notificationbold
                      : CACSAIcons.notificationnormal),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
