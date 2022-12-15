import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/button.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widget_functions.dart';
import '../auth/login_view.dart';

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
                children: [
                  const Item(
                    text: "About CACSA App",
                  ),
                  const Item(text: "Subscribe (Premium Access)"),
                  const Item(text: "Contact Support"),
                  const Item(text: "Check for Update"),
                  GestureDetector(
                      onTap: () {
                        logout(context);
                      },
                      child: const Item(text: "Log Out")),
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
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: const TextStyle(
            color: textColorBlack,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: 'Euclid-Medium'),
      ),
      const Divider(
        color: textColorBlack,
        thickness: 0.5,
      ),
      addVerticalSpace(10),
    ]);
  }
}

logout(BuildContext context) {
  return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            icon: const Icon(
              Icons.logout_sharp,
              color: primaryBgColor,
            ),
            title: const Text('Log Out'),
            actions: [
              const Center(child: Text("Are you sure you")),
              const Center(child: Text('want to log out ? ')),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: AppButtons(
                        textColor: Colors.black,
                        backgroundColor: bgWhite,
                        text: "Yes",
                        borderColor: textColorBlack,
                        onTap: () async {
                          await AuthController().logout();
                          Get.offAll(() => const Login());
                        }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButtons(
                        textColor: bgWhite,
                        backgroundColor: primaryBgColor,
                        text: "No",
                        borderColor: primaryBgColor,
                        onTap: () {
                          Get.back();
                        }),
                  )
                ]),
              )
            ],
          )));
}
