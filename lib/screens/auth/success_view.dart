import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: deviceHeight * 0.85,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Congrats!",
                  ),
                  Image.asset(successCheck),
                  const Text(
                    "Your Account has Been\nSuccessfully Created!",
                    textAlign: TextAlign.center,
                  ),
                  AppButtons(
                    textColor: Colors.white,
                    backgroundColor: primaryBgColor,
                    borderColor: Colors.transparent,
                    text: "Subscribe Now",
                    onTap: () {
                      Get.offAllNamed(Routes.REFERAL);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
