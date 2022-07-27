import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

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
          SizedBox(
            height: deviceHeight * 0.25,
            width: deviceWidth * 0.25,
            child: Image.asset(splashLogo),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: deviceHeight * 0.65,
            child: Column(
              children: [
                InputTextField(
                  controller: emailController,
                  label: "Email",
                  obscureText: false,
                ),
                InputTextField(
                  controller: passwordController,
                  label: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 28),
                AppButtons(
                  textColor: Colors.white,
                  backgroundColor: primaryBgColor,
                  borderColor: Colors.transparent,
                  text: "Log in",
                  onTap: (() {}),
                ),
                const SizedBox(height: 12),
                AppButtons(
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  text: "Sign Up",
                  onTap: () {
                    Get.offAllNamed(Routes.SIGNUP);
                  },
                ),
                const SizedBox(height: 12),
                const Text("Forgot Password?")
              ],
            ),
          )
        ],
      )),
    );
  }
}
