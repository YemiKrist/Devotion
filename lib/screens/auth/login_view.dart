import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              children: const [
                InputTextField(
                  label: "Email",
                  obscureText: false,
                ),
                InputTextField(
                  label: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 28),
                AppButtons(
                    textColor: Colors.white,
                    backgroundColor: primaryBgColor,
                    borderColor: Colors.transparent,
                    text: "Log in"),
                SizedBox(height: 12),
                AppButtons(
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  text: "Sign Up",
                  //onTap: ()=>,
                ),
                SizedBox(height: 12),
                Text("Forgot Password?")
              ],
            ),
          )
        ],
      )),
    );
  }
}
