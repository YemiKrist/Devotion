import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/controllers/splash_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset(splashLogo),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "POWERED BY",
                  style: TextStyle(
                    fontFamily: 'Euclid-Bold',
                    fontSize: (9.7),
                    letterSpacing: 3,
                  ),
                ),
                addVerticalSpace(5),
                Image.asset(thinkTech),
              ],
            ),
          )
        ],
      ),
    );
  }
}
