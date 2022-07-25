import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
            height: deviceHeight * 0.75,
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    const Text("Please Fill the Form Below"),
                    const InputTextField(
                      label: "First Name",
                      obscureText: false,
                    ),
                    const InputTextField(
                      label: "Last Name",
                      obscureText: false,
                    ),
                    const InputTextField(
                      label: "Email",
                      obscureText: false,
                    ),
                    const InputTextField(
                      label: "Password",
                      obscureText: true,
                    ),
                    const InputTextField(
                      label: "State",
                      obscureText: false,
                    ),
                    const InputTextField(
                      label: "Church Name",
                      obscureText: false,
                    ),
                    const SizedBox(height: 28),
                    AppButtons(
                      textColor: Colors.white,
                      backgroundColor: primaryBgColor,
                      borderColor: Colors.transparent,
                      text: "Sign Up",
                      onTap: () {
                        Get.offAllNamed(Routes.SUCCESS);
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
