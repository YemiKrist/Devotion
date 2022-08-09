import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widget_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(),
            Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 21),
                height: deviceHeight * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Text(
                            "Forgot Password?",
                            style: themeData.textTheme.headline4,
                          ),
                          addVerticalSpace(9),
                          Text(
                            "Kindly enter your email address to receive a reset code",
                            textAlign: TextAlign.center,
                            style: themeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(15),
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
                    const SizedBox(height: 10),
                    AppButtons(
                      textColor: Colors.white,
                      backgroundColor: primaryBgColor,
                      borderColor: Colors.transparent,
                      text: "Send",
                      onTap: (() {
                        if (_formkey.currentState!.validate()) {
                          AuthController.instance
                              .resetPassword(emailController.text.trim());
                        }
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
