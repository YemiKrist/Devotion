import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final stateController = TextEditingController();
  final churchNameController = TextEditingController();

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
              // child: Expanded(
              child: Column(
                children: [
                  const Text("Please Fill the Form Below"),
                  InputTextField(
                    controller: firstNameController,
                    label: "First Name",
                    obscureText: false,
                  ),
                  InputTextField(
                    controller: lastNameController,
                    label: "Last Name",
                    obscureText: false,
                  ),
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
                  InputTextField(
                    controller: stateController,
                    label: "State",
                    obscureText: false,
                  ),
                  InputTextField(
                    controller: churchNameController,
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
                      AuthController.instance.signUp(
                          firstNameController.text.trim(),
                          lastNameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          stateController.text.trim(),
                          churchNameController.text.trim());
                      // Get.offAllNamed(Routes.SUCCESS);
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          //)
        ],
      )),
    );
  }
}
