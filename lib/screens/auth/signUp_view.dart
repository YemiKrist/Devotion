import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

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
                  children: const [
                    Text("Please Fill the Form Below"),
                    InputTextField(
                      label: "First Name",
                      obscureText: false,
                    ),
                    InputTextField(
                      label: "Last Name",
                      obscureText: false,
                    ),
                    InputTextField(
                      label: "Email",
                      obscureText: false,
                    ),
                    InputTextField(
                      label: "Password",
                      obscureText: true,
                    ),
                    InputTextField(
                      label: "State",
                      obscureText: false,
                    ),
                    InputTextField(
                      label: "Church Name",
                      obscureText: false,
                    ),
                    SizedBox(height: 28),
                    AppButtons(
                        textColor: Colors.white,
                        backgroundColor: primaryBgColor,
                        borderColor: Colors.transparent,
                        text: "Sign Up"),
                    SizedBox(height: 12),
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
