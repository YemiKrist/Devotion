import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../commons/navigation_bar.dart';
import '../utils/colors.dart';
import '../utils/sizes.dart';
import '../utils/widget_functions.dart';

class Misc extends StatefulWidget {
  const Misc({Key? key}) : super(key: key);

  @override
  State<Misc> createState() => _MiscState();
}

class _MiscState extends State<Misc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      bottomNavigationBar: const MyNavBar(),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            addVerticalSpace(20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: const [
                  Icon(
                    Feather.arrow_left_circle,
                    color: textColorWhite,
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: textColorWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Euclid-Medium'),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: heightSize(350),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: splashBackgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: heightSize(20)),
                  const Icon(
                    Octicons.alert,
                    size: 80,
                    color: primaryBgColor,
                  ),
                  SizedBox(height: heightSize(20)),
                  const Text(
                    "Work in Pogress",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: 'Euclid-Bold',
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: heightSize(60),
                        decoration: BoxDecoration(
                          color: primaryBgColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                                color: textColorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Euclid-Medium'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
