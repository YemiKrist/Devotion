import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/navigation_bar.dart';
import '../../utils/widget_functions.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: bgGrey,
      body: SafeArea(
          child: Container(
        // padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(),
            const Expanded(
              child: Center(
                child: Text(
                  "Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColorGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Euclid-Medium'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Item(
                    text: "About CACSA App",
                    route: "/about",
                  ),
                  Item(
                    text: "Subscribe (Premium Access)",
                    route: "/",
                  ),
                  Item(
                    text: "Contact Support",
                    route: "/",
                  ),
                  Item(
                    text: "Check for Update",
                    route: "/",
                  ),
                  Item(
                    text: "Log Out",
                    route: "/",
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.text,
    required this.route,
  }) : super(key: key);

  final String text, route;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () => {Get.toNamed(route)},
        child: Text(
          text,
          style: const TextStyle(
              color: textColorBlack,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              fontFamily: 'Euclid-Medium'),
        ),
      ),
      const Divider(
        color: textColorBlack,
        thickness: 0.5,
      ),
      addVerticalSpace(10),
    ]);
  }
}
