import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/screens/auth/forgot_password.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widget_functions.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: deviceHeight * 0.25,
              width: deviceWidth * 0.25,
              child: Image.asset(splashLogo),
            ),
            addVerticalSpace(deviceHeight * 0.09),
            Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 21),
                height: deviceHeight * 0.65,
                child: Column(
                  children: [
                    InputTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      validator: (value) {
                        bool isEmailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be left empty';
                        } else if (!isEmailValid) {
                          return 'email is invalid';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                    ),
                    InputTextField(
                      controller: passwordController,
                      label: "Password",
                      textInputAction: true,
                      obscureText: true,
                      password: true,
                    ),
                    const SizedBox(height: 28),
                    AppButtons(
                      textColor: Colors.white,
                      backgroundColor: primaryBgColor,
                      borderColor: Colors.transparent,
                      text: "Log in",
                      onTap: (() {
                        if (_formkey.currentState!.validate()) {
                          AuthController.instance.login(
                              emailController.text.trim(),
                              passwordController.text.trim());
                        }
                      }),
                    ),
                    addVerticalSpace(12),
                    AppButtons(
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      text: "Sign Up",
                      onTap: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                    ),
                    //addVerticalSpace(5),
                    TextButton(
                      onPressed: () {
                        Get.to(const ForgotPassword());
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
