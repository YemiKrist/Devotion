import 'dart:developer';

import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/strings.dart';
import 'package:cacsa/screens/settings/about_the_app.dart';
import 'package:cacsa/screens/settings/admin_notification.dart';
import 'package:cacsa/screens/settings/subscribe.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../commons/navigation_bar.dart';
import '../../utils/widget_functions.dart';
import '../auth/auth_controller.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String email = "";

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString('userEmail') ?? "";
    log("------____$email");
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
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
                children: [
                  const Item(
                    text: "About CACSA App",
                    route: "about",
                  ),
                  const Item(
                    text: "Subscribe (Premium Access)",
                    route: "subscribe",
                  ),
                  const Item(
                    text: "Contact Support",
                    route: "support",
                  ),
                  const Item(
                    text: "Check for Update",
                    route: "/",
                  ),
                  const Item(
                    text: "Log Out",
                    route: "logout",
                  ),
                  if (allowedEmailList.contains(email))
                    const Item(
                      text: "Send Notification (Admin)",
                      route: "admin",
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
        onTap: () => {
          if (route == 'logout')
            {
              Get.defaultDialog(
                title: "",
                content: Column(
                  children: [
                    Image.asset(("assets/icons/log-out.png")),
                    const Text(
                      "Log Out",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const Text(
                      "Are you sure you\nwant to logout",
                      style: TextStyle(
                          color: textColorBlack,
                          fontSize: 16,
                          fontFamily: 'Euclid-Medium'),
                    )
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          AuthController.instance.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: borderColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          minimumSize: const Size(120, 35),
                        ),
                        child: const Text(
                          "yes",
                          style: TextStyle(
                              color: textColorBlack,
                              fontFamily: 'Euclid-Normal'),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            minimumSize: const Size(120, 35),
                          ),
                          onPressed: () {
                            Get.close(1);
                          },
                          child: const Text(
                            "no",
                            style: TextStyle(fontFamily: 'Euclid-Normal'),
                          ))
                    ],
                  )
                ],
              )
            }
          else if (route == "admin")
            {
              Get.to(() => const AdminNotification()),
            }
          else if (route == "about")
            {
              Get.to(() => const AboutTheApp()),
            }
          else if (route == "subscribe")
            {Get.to(() => const SubscribeToApp())}
          else if (route == "support")
            {}
          else
            Get.toNamed('/$route')
        },
        child: Text(
          text,
          style: const TextStyle(
              color: textColorBlack,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              fontFamily: 'Euclid-Regular'),
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
