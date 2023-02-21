import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Refral extends StatelessWidget {
  const Refral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Center(
              child: Card(
                elevation: 10,
                shadowColor: Colors.black12,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: SizedBox(
                    //width: deviceWidth * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const InputTextField(
                            label: "Refferral Number", obscureText: false),
                        AppButtons(
                          textColor: Colors.white,
                          backgroundColor: primaryBgColor,
                          borderColor: Colors.transparent,
                          text: "Subscribe Now",
                          onTap: () {
                            Get.offAllNamed(Routes.MAIN_PAGE);
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
