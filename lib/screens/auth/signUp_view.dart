import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(100),
                    const Text(
                      "Please Fill the Form Below",
                    ),
                    addVerticalSpace(20),
                    InputTextField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      label: "First Name",
                      obscureText: false,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value! == null || value!.isEmpty) {
                          return 'First Name cannot be Empty';
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter a Valid name(Min. 3 Characters)");
                        }
                        return null;
                      },
                    ),
                    InputTextField(
                        controller: lastNameController,
                        label: "Last Name",
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last name cannot be left empty';
                          }
                        }),
                    InputTextField(
                        controller: emailController,
                        label: "Email",
                        obscureText: false,
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
                        }),
                    InputTextField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        password: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password cannot be left empty';
                          } else {
                            return null;
                          }
                        }),
                    InputTextField(
                        controller: stateController,
                        label: "State",
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'state cannot be left empty';
                          }
                        }),
                    InputTextField(
                        controller: churchNameController,
                        label: "Church Name",
                        obscureText: false,
                        textInputAction: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your Church name';
                          }
                        }),
                    const SizedBox(height: 28),
                    AppButtons(
                      textColor: Colors.white,
                      backgroundColor: primaryBgColor,
                      borderColor: Colors.transparent,
                      text: "Sign Up",
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          AuthController.instance.signUp(
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              stateController.text.trim(),
                              churchNameController.text.trim());
                          // Get.offAllNamed(Routes.SUCCESS);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            //)
          ],
        ),
      )),
    );
  }
}
